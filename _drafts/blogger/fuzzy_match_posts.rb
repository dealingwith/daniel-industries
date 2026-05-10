#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
require "cgi"
require "fileutils"
require "optparse"
require "set"
require "time"
require "yaml"

DEFAULT_OPTIONS = {
  posts_dir: File.expand_path("../../_posts", __dir__),
  output: File.expand_path("blogger_match_report.txt", __dir__),
  source_dir: nil,
  unmatched_dir: nil,
  date_window: 3,
  min_score: 0.22,
  progress_every: 25,
  yes: false
}.freeze

options = DEFAULT_OPTIONS.dup

OptionParser.new do |parser|
  parser.banner = "Usage: ruby fuzzy_match_posts.rb [options]"
  parser.on("--posts-dir PATH", "Jekyll _posts directory. Default: ../../_posts") { |value| options[:posts_dir] = File.expand_path(value) }
  parser.on("--output PATH", "Report path. Default: blogger_match_report.txt") { |value| options[:output] = File.expand_path(value) }
  parser.on("--source-dir PATH", "Only parse markdown files in this source directory") { |value| options[:source_dir] = File.expand_path(value, __dir__) }
  parser.on("--unmatched-dir PATH", "Directory for copies of unmatched source files. Default: SOURCE_DIR/unmatched") { |value| options[:unmatched_dir] = File.expand_path(value, __dir__) }
  parser.on("--date-window DAYS", Integer, "Only compare posts within this many days. Default: 3") { |value| options[:date_window] = value }
  parser.on("--min-score SCORE", Float, "Minimum similarity threshold for a match. Default: 0.22") { |value| options[:min_score] = value }
  parser.on("--top N", Integer, "Accepted for compatibility; ignored") { |_value| }
  parser.on("--progress-every N", Integer, "Print progress every N source files. Default: 25") { |value| options[:progress_every] = value }
  parser.on("-y", "--yes", "Run without continue prompts") { options[:yes] = true }
end.parse!

ROOT = __dir__
Post = Struct.new(
  :path,
  :relative_path,
  :date,
  :title,
  :body,
  :tokens,
  :shingles,
  keyword_init: true
)

def relative(path, base = ROOT)
  path.sub(%r{\A#{Regexp.escape(base)}/?}, "")
end

def compact_path(path)
  parts = relative(path).split("/")
  parts.length >= 2 ? parts.last(2).join("/") : parts.join("/")
end

def inside_dir?(path, dir)
  expanded_path = File.expand_path(path)
  expanded_dir = File.expand_path(dir)
  expanded_path == expanded_dir || expanded_path.start_with?("#{expanded_dir}/")
end

def read_post(path)
  raw = File.read(path)
  frontmatter = {}
  body = raw

  if raw.start_with?("---\n")
    parts = raw.split(/^---\s*$\n?/, 3)
    if parts.length >= 3
      frontmatter = YAML.safe_load(parts[1], permitted_classes: [Date, Time], aliases: true) || {}
      body = parts[2]
    end
  end

  date = parse_date(frontmatter["date"] || path)
  title = frontmatter["title"].to_s
  normalized_body = normalize_text(body)
  tokens = normalized_body.split

  Post.new(
    path: path,
    relative_path: relative(path),
    date: date,
    title: title,
    body: normalized_body,
    tokens: tokens,
    shingles: shingles(tokens)
  )
end

def parse_date(value)
  text = value.to_s
  parsed = Time.parse(text)
  parsed.to_date
rescue ArgumentError
  match = text.match(/(\d{4})-(\d{2})-(\d{2})/)
  match ? Date.new(match[1].to_i, match[2].to_i, match[3].to_i) : nil
end

def normalize_text(value)
  text = value.to_s.dup
  text.gsub!(/```.*?```/m, " ")
  text.gsub!(/<script\b.*?<\/script>/mi, " ")
  text.gsub!(/<style\b.*?<\/style>/mi, " ")
  text.gsub!(/<[^>]+>/m, " ")
  text.gsub!(/\[[^\]]+\]\([^)]+\)/, " ")
  text = CGI.unescapeHTML(text)
  text.downcase!
  text.gsub!(/[^a-z0-9]+/, " ")
  text.gsub!(/\b[a-z0-9]\b/, " ")
  text.squeeze!(" ")
  text.strip
end

def shingles(tokens, size = 5)
  return Set.new(tokens) if tokens.length < size

  tokens.each_cons(size).map { |parts| parts.join(" ") }.to_set
end

def jaccard(left, right)
  return 0.0 if left.empty? || right.empty?

  intersection = (left & right).length.to_f
  union = (left | right).length
  union.zero? ? 0.0 : intersection / union
end

def title_similarity(left, right)
  left_words = normalize_text(left).split.to_set
  right_words = normalize_text(right).split.to_set
  jaccard(left_words, right_words)
end

def score(source, candidate, date_window)
  body_score = jaccard(source.shingles, candidate.shingles)
  title_score = title_similarity(source.title, candidate.title)
  containment = if source.shingles.empty? || candidate.shingles.empty?
                  0.0
                else
                  shared = (source.shingles & candidate.shingles).length.to_f
                  shared / [source.shingles.length, candidate.shingles.length].min
                end

  days_apart = if source.date && candidate.date
                 (source.date - candidate.date).abs.to_i
               else
                 date_window + 1
               end
  date_score = days_apart <= date_window ? 1.0 - (days_apart.to_f / (date_window + 1)) : 0.0

  [
    (body_score * 0.65) + (containment * 0.20) + (title_score * 0.10) + (date_score * 0.05),
    body_score,
    containment,
    title_score,
    date_score,
    days_apart
  ]
end

def ask_continue(message)
  print "#{message} Continue? Y/n: "
  answer = STDIN.gets
  return true unless answer

  normalized = answer.strip.downcase
  normalized.empty? || normalized.start_with?("y")
end

def candidate_posts(source, posts_by_date, all_posts, date_window)
  return all_posts unless source.date

  start_date = source.date - date_window
  end_date = source.date + date_window
  candidates = []

  (start_date..end_date).each do |date|
    candidates.concat(posts_by_date.fetch(date, []))
  end

  candidates.empty? ? all_posts : candidates
end

unless Dir.exist?(options[:posts_dir])
  warn "Posts directory does not exist: #{options[:posts_dir]}"
  warn "From this folder, ../../_posts appears to be the likely path. Try:"
  warn "  ruby fuzzy_match_posts.rb --posts-dir ../../_posts"
  exit 1
end

if options[:source_dir] && !Dir.exist?(options[:source_dir])
  warn "Source directory does not exist: #{options[:source_dir]}"
  exit 1
end

source_root = options[:source_dir] || ROOT
unmatched_dir = options[:unmatched_dir] || File.join(source_root, "unmatched")
source_paths = Dir.glob(File.join(source_root, "**", "*.md"))
                  .reject { |path| File.expand_path(path) == options[:output] }
                  .reject { |path| inside_dir?(path, unmatched_dir) }
                  .sort
post_paths = Dir.glob(File.join(options[:posts_dir], "*.md")).sort

puts "Loading #{source_paths.length} source markdown files from #{source_root}"
sources = source_paths.map { |path| read_post(path) }

puts "Loading #{post_paths.length} target markdown files from #{options[:posts_dir]}"
posts = post_paths.map { |path| read_post(path) }
posts_by_date = posts.group_by(&:date)

puts "Writing no-match report to #{options[:output]}"
puts "Copying unmatched source files to #{unmatched_dir}"

processed = 0
without_matches = []
previous_dir = nil

sources.each do |source|
  current_dir = File.dirname(source.relative_path)

  if !options[:yes] && previous_dir && current_dir != previous_dir
    break unless ask_continue("Finished #{previous_dir}: processed #{processed}, no-match files #{without_matches.length}.")
  end
  previous_dir = current_dir

  candidates = candidate_posts(source, posts_by_date, posts, options[:date_window])
  matched = candidates.any? do |candidate|
    total, = score(source, candidate, options[:date_window])
    total >= options[:min_score]
  end

  processed += 1
  without_matches << source unless matched

  if (processed % options[:progress_every]).zero?
    status = matched ? "matched" : "no match"
    puts "[#{processed}/#{sources.length}] #{compact_path(source.path)}: #{status}"
  end

end

File.open(options[:output], "w") do |report|
  without_matches.sort_by(&:relative_path).each do |source|
    report.puts source.relative_path
  end
end

without_matches.each do |source|
  source_relative_path = source.path.sub(%r{\A#{Regexp.escape(source_root)}/?}, "")
  destination = File.join(unmatched_dir, source_relative_path)
  FileUtils.mkdir_p(File.dirname(destination))
  FileUtils.cp(source.path, destination)
end

puts "Done. Processed #{processed}/#{sources.length}; no-match files: #{without_matches.length}."
puts "Report: #{options[:output]}"
puts "Unmatched copies: #{unmatched_dir}"
