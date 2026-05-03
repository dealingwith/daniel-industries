#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"
require "rexml/document"
require "rexml/xpath"
require "time"
require "yaml"

ATOM_NS = "http://www.w3.org/2005/Atom"
BLOGGER_NS = "http://schemas.google.com/blogger/2018"
NS = { "atom" => ATOM_NS, "blogger" => BLOGGER_NS }.freeze

root = ARGV[0] ? File.expand_path(ARGV[0]) : __dir__
feed_paths = Dir.glob(File.join(root, "**", "feed.atom")).sort

def text_at(node, xpath)
  found = REXML::XPath.first(node, xpath, NS)
  found&.text.to_s.strip
end

def post_id(entry)
  id = text_at(entry, "atom:id")
  id[/post-([^.]+)/, 1] || id.split(/[.:\/-]/).last || "post"
end

def slugify(value)
  value
    .downcase
    .gsub(/&[a-z0-9#]+;/, " ")
    .gsub(/[^a-z0-9]+/, "-")
    .gsub(/\A-+|-+\z/, "")
end

def write_post(entry, feed_dir)
  published = text_at(entry, "atom:published")
  updated = text_at(entry, "atom:updated")
  date_text = published.empty? ? updated : published
  date = Time.iso8601(date_text)

  original_title = text_at(entry, "atom:title")
  frontmatter_title = original_title.empty? ? "..." : original_title
  filename_slug = slugify(original_title)
  entry_post_id = post_id(entry)
  filename_slug = filename_slug.empty? ? entry_post_id : "#{filename_slug}-#{entry_post_id}"

  basename = "#{date.strftime("%Y-%m-%d")}-#{filename_slug}.md"
  destination = File.join(feed_dir, basename)

  content = text_at(entry, "atom:content")
  frontmatter = {
    "date" => date.iso8601,
    "title" => frontmatter_title,
    "category" => nil,
    "layout" => "post"
  }

  File.write(destination, "#{frontmatter.to_yaml}---\n\n#{content}\n")
  destination
end

created = []

feed_paths.each do |feed_path|
  feed_dir = File.dirname(feed_path)
  document = REXML::Document.new(File.read(feed_path))

  REXML::XPath.each(document, "/atom:feed/atom:entry", NS) do |entry|
    next unless text_at(entry, "blogger:type").empty? || text_at(entry, "blogger:type") == "POST"

    created << write_post(entry, feed_dir)
  end
end

puts "Created #{created.length} markdown files from #{feed_paths.length} feed.atom files."
