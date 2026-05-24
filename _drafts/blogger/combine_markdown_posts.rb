#!/usr/bin/env ruby
# frozen_string_literal: true

require "cgi"
require "optparse"

ROOT = __dir__

DEFAULT_OPTIONS = {
  source_dir: nil,
  output: nil
}.freeze

options = DEFAULT_OPTIONS.dup

OptionParser.new do |parser|
  parser.banner = "Usage: ruby combine_markdown_posts.rb [options]"
  parser.on("--source-dir PATH", "Combine markdown files from this source directory") { |value| options[:source_dir] = File.expand_path(value, __dir__) }
  parser.on("--output PATH", "Output markdown path. Default: SOURCE_DIR_NAME.md in this directory") { |value| options[:output] = File.expand_path(value, __dir__) }
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

def strip_frontmatter(markdown)
  markdown.sub(/\A---\s*\n.*?\n---\s*\n/m, "")
end

def strip_html(markdown)
  text = markdown.dup
  text.gsub!(/<!--.*?-->/m, "")
  text.gsub!(/<script\b.*?<\/script>/mi, "")
  text.gsub!(/<style\b.*?<\/style>/mi, "")
  text.gsub!(/<[^>]+>/m, "")
  CGI.unescapeHTML(text)
end

def clean_markdown(markdown)
  strip_html(strip_frontmatter(markdown)).strip
end

source_dir = options[:source_dir] || choose_source_dir

unless Dir.exist?(source_dir)
  warn "Source directory does not exist: #{source_dir}"
  exit 1
end

output_path = options[:output] || File.join(ROOT, "#{File.basename(source_dir)}.md")
markdown_paths = Dir.glob(File.join(source_dir, "**", "*.md")).sort

if markdown_paths.empty?
  warn "No markdown files found in #{source_dir}."
  exit 1
end

combined_content = markdown_paths.filter_map do |path|
  content = clean_markdown(File.read(path))
  content.empty? ? nil : content
end.join("\n\n")

File.write(output_path, "#{combined_content}\n")

puts "Combined #{markdown_paths.length} markdown files from #{source_dir}."
puts "Output: #{output_path}"
