#!/usr/bin/env ruby
# frozen_string_literal: true

require "date"
require "cgi"
require "optparse"
require "set"
require "time"
require "yaml"

DEFAULT_OPTIONS = {
  posts_dir: File.expand_path("../../_posts", __dir__),
  output: File.expand_path("blogger_match_report.txt", __dir__),
  source_dir: nil,
  date_window: 3,
  min_score: 0.22,
  top: 5,
  progress_every: 25,
  yes: false
}.freeze

options = DEFAULT_OPTIONS.dup

OptionParser.new do |parser|
  parser.banner = "Usage: ruby fuzzy_match_posts.rb [options]"
  parser.on("--posts-dir PATH", "Jekyll _posts directory. Default: ../../_posts") { |value| options[:posts_dir] = File.expand_path(value) }
  parser.on("--output PATH", "Report path. Default: blogger_match_report.txt") { |value| options[:output] = File.expand_path(value) }
  parser.on("--source-dir PATH", "Only parse markdown files in this source directory") { |value| options[:source_dir] = File.expand_path(value, __dir__) }
  parser.on("--date-window DAYS", Integer, "Only compare posts within this many days. Default: 3") { |value| options[:date_window] = value }
  parser.on("--min-score SCORE", Float, "Minimum score to report. Default: 0.22") { |value| options[:min_score] = value }
  parser.on("--top N", Integer, "Maximum matches per source file. Default: 5") { |value| options[:top] = value }
  parser.on("--progress-every N", Integer, "Print progress every N source files. Default: 25") { |value| options[:progress_every] = value }
  parser.on("-y", "--yes", "Run without continue prompts") { options[:yes] = true }
end.parse!

ROOT = __dir__
REPORT_HEADER = <<~TEXT
  Blogger fuzzy match report
  Generated: #{Time.now.iso8601}
  Source root: #{ROOT}
  Source dir: #{options[:source_dir] || "all"}
  Posts dir: #{options[:posts_dir]}
  Date window: +/- #{options[:date_window]} days
  Minimum score: #{options[:min_score]}

TEXT

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
source_paths = Dir.glob(File.join(source_root, "**", "*.md"))
                  .reject { |path| File.expand_path(path) == options[:output] }
                  .sort
post_paths = Dir.glob(File.join(options[:posts_dir], "*.md")).sort

puts "Loading #{source_paths.length} source markdown files from #{source_root}"
sources = source_paths.map { |path| read_post(path) }

puts "Loading #{post_paths.length} target markdown files from #{options[:posts_dir]}"
posts = post_paths.map { |path| read_post(path) }
posts_by_date = posts.group_by(&:date)

puts "Writing no-match report to #{options[:output]}"
puts "Scoring uses normalized text shingles, title overlap, containment, and date proximity."

processed = 0
with_matches = 0
without_matches = []
previous_dir = nil

sources.each do |source|
  current_dir = File.dirname(source.relative_path)

  if !options[:yes] && previous_dir && current_dir != previous_dir
    break unless ask_continue("Finished #{previous_dir}: processed #{processed}, no-match files #{without_matches.length}.")
  end
  previous_dir = current_dir

  candidates = candidate_posts(source, posts_by_date, posts, options[:date_window])
  scored = candidates.map do |candidate|
    total, body, containment, title, date, days = score(source, candidate, options[:date_window])
    {
      post: candidate,
      total: total,
      body: body,
      containment: containment,
      title: title,
      date: date,
      days: days
    }
  end

  matches = scored
            .select { |item| item[:total] >= options[:min_score] }
            .sort_by { |item| -item[:total] }
            .first(options[:top])

  best = scored.max_by { |item| item[:total] }

  processed += 1
  if matches.empty?
    without_matches << { source: source, best: best }
  else
    with_matches += 1
  end

  if (processed % options[:progress_every]).zero?
    status = if matches.any?
               "match=#{format("%.3f", matches.first[:total])} -> #{compact_path(matches.first[:post].path)}"
             elsif best
               "no match; best=#{format("%.3f", best[:total])} -> #{compact_path(best[:post].path)}"
             else
               "no candidates"
             end
    puts "[#{processed}/#{sources.length}] #{compact_path(source.path)}: #{status}"
  end

end

no_match_by_dir = without_matches.group_by { |item| File.dirname(item[:source].relative_path) }
total_by_dir = sources.first(processed).group_by { |source| File.dirname(source.relative_path) }

File.open(options[:output], "w") do |report|
  report.write(REPORT_HEADER)
  report.puts "SUMMARY"
  report.puts "Processed: #{processed}/#{sources.length}"
  report.puts "Files with potential matches: #{with_matches}"
  report.puts "Files without potential matches: #{without_matches.length}"
  report.puts
  report.puts "No-match files by folder:"
  total_by_dir.sort.each do |folder, sources_in_folder|
    no_match_count = no_match_by_dir.fetch(folder, []).length
    report.puts "  #{folder}: #{no_match_count}/#{sources_in_folder.length}"
  end
  report.puts

  no_match_by_dir.sort.each do |folder, items|
    report.puts "## #{folder}"
    items.sort_by { |item| item[:source].relative_path }.each do |item|
      source = item[:source]
      best = item[:best]
      report.print "- #{compact_path(source.path)}"

      if best
        report.print " (best below threshold: #{format("%.3f", best[:total])} -> #{compact_path(best[:post].path)})"
      end

      report.puts
    end
    report.puts
  end
end

puts "Done. Processed #{processed}/#{sources.length}; no-match files: #{without_matches.length}."
puts "Report: #{options[:output]}"
