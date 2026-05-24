#!/usr/bin/env ruby
# frozen_string_literal: true

require "optparse"

ROOT = __dir__
WORKSPACE_ROOT = File.expand_path("../..", __dir__)
FILE_WORKSPACE_PREFIX = 'file://${workspaceFolder}/'

DEFAULT_OPTIONS = {
  report: File.expand_path("blogger_match_report.txt", __dir__),
  source_dir: nil,
  yes: false
}.freeze

options = DEFAULT_OPTIONS.dup

OptionParser.new do |parser|
  parser.banner = "Usage: ruby delete_matched_source_posts.rb [options]"
  parser.on("--report PATH", "Match report path. Default: blogger_match_report.txt") { |value| options[:report] = File.expand_path(value, __dir__) }
  parser.on("--source-dir PATH", "Delete only matched source files in this source directory") { |value| options[:source_dir] = File.expand_path(value, __dir__) }
  parser.on("-y", "--yes", "Delete without confirmation prompt") { options[:yes] = true }
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

  puts "Choose the source folder to delete matched files from:"
  source_dirs.each.with_index(1) do |path, index|
    puts "  #{index}. #{File.basename(path)}"
  end
  print "Source folder number: "

  selected = STDIN.gets&.strip.to_i
  return source_dirs[selected - 1] if selected.between?(1, source_dirs.length)

  warn "Invalid source folder selection."
  exit 1
end

def inside_dir?(path, dir)
  expanded_path = File.expand_path(path)
  expanded_dir = File.expand_path(dir)
  expanded_path == expanded_dir || expanded_path.start_with?("#{expanded_dir}/")
end

def path_from_source_line(line)
  value = line.sub(/\ASource:\s*/, "").strip

  if value.start_with?(FILE_WORKSPACE_PREFIX)
    relative_path = value.delete_prefix(FILE_WORKSPACE_PREFIX)
    return File.expand_path(relative_path, WORKSPACE_ROOT)
  end

  if value.start_with?("file://")
    return File.expand_path(value.delete_prefix("file://"))
  end

  File.expand_path(value, ROOT)
end

unless File.file?(options[:report])
  warn "Match report does not exist: #{options[:report]}"
  exit 1
end

source_root = options[:source_dir] || choose_source_dir

unless Dir.exist?(source_root)
  warn "Source directory does not exist: #{source_root}"
  exit 1
end

matched_source_paths = File.readlines(options[:report], chomp: true)
                           .grep(/\ASource:\s*/)
                           .map { |line| path_from_source_line(line) }
                           .uniq
                           .sort

delete_paths = []
skipped_paths = []

matched_source_paths.each do |path|
  if inside_dir?(path, source_root) && File.file?(path)
    delete_paths << path
  else
    skipped_paths << path
  end
end

if delete_paths.empty?
  puts "No matched source files found to delete in #{source_root}."
  puts "Skipped #{skipped_paths.length} report entries outside the source directory or missing on disk." if skipped_paths.any?
  exit
end

puts "Matched source files to delete from #{source_root}:"
delete_paths.each { |path| puts "  #{path}" }

if skipped_paths.any?
  puts
  puts "Skipped #{skipped_paths.length} report entries outside the source directory or missing on disk."
end

unless options[:yes]
  print "Delete #{delete_paths.length} matched source files? Type DELETE to continue: "
  answer = STDIN.gets&.strip
  unless answer == "DELETE"
    puts "Canceled."
    exit
  end
end

delete_paths.each { |path| File.delete(path) }

puts "Deleted #{delete_paths.length} matched source files from #{source_root}."
