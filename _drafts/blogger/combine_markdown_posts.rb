#!/usr/bin/env ruby
# frozen_string_literal: true

require "cgi"
require "date"
require "optparse"
require "time"
require "yaml"

ROOT = __dir__

DEFAULT_OPTIONS = {
  source_dir: nil,
  output: nil,
  h1_separators: false,
  keep_non_whitespace_html: false
}.freeze

options = DEFAULT_OPTIONS.dup

OptionParser.new do |parser|
  parser.banner = "Usage: ruby combine_markdown_posts.rb [options]"
  parser.on("--source-dir PATH", "Combine markdown files from this source directory") { |value| options[:source_dir] = File.expand_path(value, __dir__) }
  parser.on("--output PATH", "Output markdown path. Default: SOURCE_DIR_NAME.md in this directory") { |value| options[:output] = File.expand_path(value, __dir__) }
  parser.on("--h1-separators", "Add H1 separators from frontmatter date and title") { options[:h1_separators] = true }
  parser.on("--keep-non-whitespace-html", "Strip only br, p, and div tags; keep other HTML") { options[:keep_non_whitespace_html] = true }
end.parse!

def choose_source_dir
  source_dirs = Dir.children(ROOT)
                   .map { |name| File.join(ROOT, name) }
                   .select { |path| File.directory?(path) }
                   .sort

  if source_dirs.empty?
    warn "No source folders found in #{ROOT}."
    exit 1
  end

  puts "Choose the source folder to combine:"
  source_dirs.each.with_index(1) do |path, index|
    puts "  #{index}. #{File.basename(path)}"
  end
  print "Source folder number: "

  selected = STDIN.gets&.strip.to_i
  return source_dirs[selected - 1] if selected.between?(1, source_dirs.length)

  warn "Invalid source folder selection."
  exit 1
end

def choose_processing_options(options)
  puts "Choose combine options:"
  puts "  0. Default: strip frontmatter and all HTML"
  puts "  1. Add H1 separators from frontmatter date and title"
  puts "  2. Keep non-whitespace HTML; strip only br, p, and div tags"
  print "Option numbers, comma-separated (default 0): "

  choices = STDIN.gets&.strip
  return if choices.nil? || choices.empty? || choices == "0"

  selected = choices.split(",").map { |choice| choice.strip.to_i }
  valid_choices = [1, 2]
  invalid_choices = selected - valid_choices

  if invalid_choices.any?
    warn "Invalid option selection: #{invalid_choices.join(", ")}"
    exit 1
  end

  options[:h1_separators] = selected.include?(1)
  options[:keep_non_whitespace_html] = selected.include?(2)
end

def split_frontmatter(markdown)
  match = markdown.match(/\A---\s*\n(.*?)\n---\s*\n/m)
  return [{}, markdown] unless match

  frontmatter = YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true) || {}
  body = markdown[match[0].length..] || ""
  [frontmatter, body]
rescue Psych::SyntaxError
  [{}, markdown]
end

def date_from_frontmatter(frontmatter)
  value = frontmatter["date"]
  return nil if value.nil?

  return value.strftime("%Y-%m-%d") if value.respond_to?(:strftime)

  Time.parse(value.to_s).strftime("%Y-%m-%d")
rescue ArgumentError
  value.to_s[/\d{4}-\d{2}-\d{2}/]
end

def h1_separator(frontmatter)
  parts = [
    date_from_frontmatter(frontmatter),
    frontmatter["title"].to_s.strip
  ].compact.reject(&:empty?)

  parts.empty? ? nil : "# #{parts.join(" ")}"
end

def strip_html(markdown)
  text = markdown.dup
  text.gsub!(/<!--.*?-->/m, "")
  text.gsub!(/<script\b.*?<\/script>/mi, "")
  text.gsub!(/<style\b.*?<\/style>/mi, "")
  text.gsub!(/<[^>]+>/m, "")
  CGI.unescapeHTML(text)
end

def strip_whitespace_html(markdown)
  text = markdown.dup
  text.gsub!(/^[ \t]*<br\b[^>]*\/?>[ \t]*(?=>)/i, "")
  text.gsub!(/^[ \t]*<br\b[^>]*\/?>[ \t]*$/i, "\n")
  text.gsub!(/<br\b[^>]*\/?>/mi, "\n")
  text.gsub!(/<\/(?:p|div)>/mi, "\n\n")
  text.gsub!(/<(?:p|div)\b[^>]*>/mi, "")
  CGI.unescapeHTML(text)
end

def normalize_blank_lines(markdown)
  markdown.gsub(/[ \t]+\n/, "\n").gsub(/\n{3,}/, "\n\n")
end

def clean_markdown(markdown, options)
  frontmatter, body = split_frontmatter(markdown)
  body = if options[:keep_non_whitespace_html]
           strip_whitespace_html(body)
         else
           strip_html(body)
         end
  body = normalize_blank_lines(body)
  body = options[:keep_non_whitespace_html] ? body.rstrip : body.strip

  parts = []
  parts << h1_separator(frontmatter) if options[:h1_separators]
  parts << body
  parts.compact.reject(&:empty?).join("\n\n")
end

def output_filename(source_dir)
  "#{File.basename(source_dir).gsub(/\s+/, "-")}.md"
end

source_dir = options[:source_dir] || choose_source_dir
choose_processing_options(options) unless options[:h1_separators] || options[:keep_non_whitespace_html]

unless Dir.exist?(source_dir)
  warn "Source directory does not exist: #{source_dir}"
  exit 1
end

output_path = options[:output] || File.join(ROOT, output_filename(source_dir))
markdown_paths = Dir.glob(File.join(source_dir, "**", "*.md")).sort

if markdown_paths.empty?
  warn "No markdown files found in #{source_dir}."
  exit 1
end

combined_content = markdown_paths.filter_map do |path|
  content = clean_markdown(File.read(path), options)
  content.empty? ? nil : content
end.join("\n\n")

File.write(output_path, "#{combined_content}\n")

puts "Combined #{markdown_paths.length} markdown files from #{source_dir}."
puts "Output: #{output_path}"
