# frozen_string_literal: true

require "erb"
require "set"

def titleize(string)
  nocap = ["a", "an", "the", "and", "as", "if", "at", "but", "by", "for", "from", "in", "into", "like", "near", "now", "that", "nor", "of", "off", "on", "once", "onto", "or", "over", "past", "so", "than", "till", "to", "up", "upon", "with", "when", "yet"]
  words = string.to_s.split(" ")

  words.map.with_index do |word, index|
    if word != word.upcase && (index.zero? || !nocap.include?(word))
      word.sub(/\S/, &:upcase)
    else
      word
    end
  end.join(" ")
end

def format_category_name(category_name)
  category_name.gsub(/-|_/, " ")
end

def format_name_for_url(category_name)
  category_name.gsub(/_|\s/, "").downcase
end

module Jekyll
  module BuildMetadata
    DEFAULT_HERO_IMAGE = "/assets/page/writing/nicole-elliott-N9De44VszLM-unsplash.png"
    module_function

    def renderable_documents(site)
      documents = site.pages.dup
      site.collections.each_value do |collection|
        documents.concat(collection.docs)
      end
      documents
    end

    def word_count(content)
      content.to_s.scan(/\S+/).count
    end

    def build_excerpt(doc)
      explicit_excerpt = doc.data["excerpt"].to_s.strip
      return explicit_excerpt unless explicit_excerpt.empty?

      source = doc.content.to_s
      # skip if a template, determined by inclusion of Liquid syntax
      return "" if source.include?("{%") || source.include?("{{")

      # `&:dup)` duplicates each string block
      # - this avoids mutating the original split strings in-place in any surprising way
      # filter_map returns an array containing truthy elements returned by the block
      excerpt = source.split(/\n{2,}/).map(&:dup).filter_map do |paragraph|
        cleaned = BuildMetadata.cleanup_excerpt_paragraph(paragraph)
        next if cleaned.empty? || BuildMetadata.media_or_caption_block?(paragraph, cleaned)

        cleaned
      end.first.to_s

      return "" if excerpt.empty?

      max_length = 300
      if excerpt.length > max_length
        truncated = excerpt[0...max_length]
        head, separator, = truncated.rpartition(/[.!?:"]\s/)
        excerpt = separator.empty? ? excerpt.partition(/[.!?:"]\s/).first : head
      end

      excerpt.sub!(/[.!?:"\s]+\z/, "")
      excerpt << "..."
    end

    def resolve_hero_image(doc, site)
      explicit_image = doc.data["image"].to_s.strip
      image = if explicit_image.empty?
          content = doc.content.to_s
          markdown_match = content.match(/!\[[^\]]*\]\((\S+?)(?:\s+"[^"]*")?\)/m)
          html_match = content.match(/<img .*?src="([^" ]+)"/m)
          markdown_match&.[](1) || html_match&.[](1)
        else
          explicit_image
        end

      absolutize_site_url(image.to_s.strip.empty? ? DEFAULT_HERO_IMAGE : image, site)
    end

    def absolutize_site_url(path_or_url, site)
      value = path_or_url.to_s.strip
      return value if value.empty? || value.start_with?("http://", "https://")

      site_url = site.config["url"].to_s.sub(%r{/\z}, "")
      return value if site_url.empty?

      normalized_path = value.start_with?("/") ? value : "/#{value}"
      "#{site_url}#{normalized_path}"
    end

    def normalized_categories(doc)
      categories = []
      categories.concat(Array(doc.data["categories"]))
      # this supports blog and writing frontmatter ("categories" and "category" respectively)
      categories << doc.data["category"] if doc.data.key?("category")
      categories.map { |category| category.to_s.strip.downcase }
                .reject(&:empty?)
                .uniq
                .sort
    end

    def extract_internal_links(content, target_urls)
      post_url_pattern = Regexp.new(
        [
          '(?:https?://[^/\s"\')]+)?',
          '(/(?:\d{4}/\d{2}/\d{2}/[^/\s"\')#?]+/))',
        ].join
      )
      found_links = Set.new
      source = content.to_s
      return found_links if source.empty?

      source.scan(post_url_pattern) do |match|
        url = Array(match).first
        found_links << url if target_urls.include?(url)
      end

      found_links
    end

    def self.cleanup_excerpt_paragraph(paragraph)
      cleaned = paragraph.dup
      cleaned.gsub!(/^\s*\[[^\]]+\]:\s+\S+.*$/, "")
      cleaned.gsub!(/!\[([^\]]*)\]\([^)]+\)/, '\1')
      cleaned.gsub!(/\[([^\]]+)\]\([^)]+\)/, '\1')
      cleaned.gsub!(/`([^`]+)`/, '\1')
      cleaned.gsub!(/^\s{0,3}[#]{1,6}\s+/, "")
      cleaned.gsub!(/^\s*>\s?/, "")
      cleaned.gsub!(/<\/?[^>]*>/, "")
      cleaned.gsub!(/[*_~]+/, "")
      cleaned.strip!
      cleaned
    end

    def self.media_or_caption_block?(paragraph, cleaned)
      source = paragraph.strip
      return true if source.start_with?("![")
      return true if source.match?(/\A<p\b[^>]*class="caption"[^>]*>.*<\/p>\z/m)
      return true if source.match?(/\A<(?:p|div)\b[^>]*>\s*<(?:img|iframe|audio)\b.*<\/(?:p|div)>\z/m)

      cleaned.length < 25 && source.match?(/\A(?:!\[[^\]]*\]\([^)]+\)|<[^>]+>|\s)+\z/m)
    end
  end

  class SiteBuildMetadataGenerator < Generator
    safe true
    priority :high

    def generate(site)
      style_file = site.static_files.find do |static_file|
        static_file.relative_path == "/assets/style.css" || static_file.path == "/assets/style.css"
      end

      site.config["style_version"] = style_file&.modified_time&.to_i

      posts = site.posts.docs
      post_urls = posts.map(&:url).to_set
      archive_counts = Hash.new(0)
      backlinks_by_url = Hash.new { |hash, key| hash[key] = [] }

      BuildMetadata.renderable_documents(site).each do |doc|
        next unless doc.respond_to?(:data)

        doc.data["word_count"] ||= BuildMetadata.word_count(doc.content)
        doc.data["computed_excerpt"] ||= BuildMetadata.build_excerpt(doc)
        doc.data["normalized_categories"] ||= BuildMetadata.normalized_categories(doc)
        doc.data["hero_image"] ||= BuildMetadata.resolve_hero_image(doc, site)
      end

      posts.each do |post|
        post.data["title"] = titleize(post.data["title"].to_s)
        archive_counts[post.date.strftime("%Y")] += 1

        BuildMetadata.extract_internal_links(post.content, post_urls).each do |target_url|
          backlinks_by_url[target_url] << {
            "url" => post.url,
            "title" => post.data["title"],
            "date" => post.date,
            "word_count" => post.data["word_count"],
            "categories" => post.data["categories"] || [],
          }
        end
      end

      posts.each do |post|
        post.data["backlinks"] = backlinks_by_url[post.url]
      end

      site.config["archive_years"] = archive_counts.sort_by { |year, _count| -year.to_i }
        .map { |year, count| { "year" => year, "count" => count } }
    end
  end

  module Backlinks
    def backlinks_array(input)
      site = @context.registers[:site]
      site.posts.docs.find { |post| post.url == input }&.data&.fetch("backlinks", []) || []
    end

    def backlink(input)
      backlinks = backlinks_array(input).map do |link|
        "<a href=\"#{link["url"]}\">#{link["title"]}</a>"
      end

      backlinks.any? ? backlinks.join(", ") : ""
    end
  end

  class CategoryListTag < Liquid::Tag
    CATEGORY_TEMPLATE = ERB.new(<<~HTML.strip)
      <div>
        <a name="<%= format_name_for_url(category_name) %>"></a>
        <h1><%= formatted_category_name %> (<%= post_count %>) <a href="#">↩</a></h1>
        <ul>
          <% posts.each do |post| %>
            <a class="archive_link<%= ' short_post' if post[:word_count] < 300 %>" href="<%= post[:url] %>">
              <li class="archive_link">
                <%= post[:title] %>
                <span class="wordcount">(<%= post[:word_count] %>)
                (<%= post[:date] %>)</span>
              </li>
            </a>
          <% end %>
        </ul>
      </div>
    HTML

    def render(context)
      html = +""
      categories = context.registers[:site].categories
      sorted_categories = categories.sort_by { |category| category[1].size }

      sorted_categories.reverse_each do |category|
        category_name = category[0]
        next if category_name.nil? || category_name.strip.empty?

        formatted_category_name = format_category_name(category_name)
        post_count = category[1].size

        posts = category[1].map do |post|
          {
            word_count: post.data["word_count"] || BuildMetadata.word_count(post.content),
            url: post.url,
            title: post.data["title"],
            date: post.date.strftime("%m/%Y"),
          }
        end

        html << CATEGORY_TEMPLATE.result(binding)
      end

      html
    end
  end

  class CategoryListTOCTag < Liquid::Tag
    def render(context)
      html = +""
      categories = context.registers[:site].categories
      sorted_categories = categories.sort_by { |category| category[1].size }
      # Add to only show categories with N posts:
      # sorted_categories = sorted_categories.delete_if { |category| category[1].size < 6 }
      sorted_categories.reverse_each do |category|
        category_name = category[0]
        next if category_name.nil? || category_name.strip.empty?

        formatted_category_name = format_category_name(category_name)
        html << "<div data-numposts=\"#{category[1].size}\" data-category=\"#{format_name_for_url(category_name)}\"><a href=\"##{format_name_for_url(category_name)}\" class=\"year_box\">#{formatted_category_name} (#{category[1].size})</a></div>"
      end

      html
    end
  end

  class CustomExcerptTag < Liquid::Tag
    def initialize(tag_name, post, tokens)
      super
      @post = post
    end

    def render(context)
      post = context[@post]
      return "" unless post

      excerpt = post["computed_excerpt"].to_s
      return excerpt unless excerpt.empty?

      explicit_excerpt = post["excerpt"].to_s.strip
      return explicit_excerpt unless explicit_excerpt.empty?

      excerpt = post["content"].to_s.partition(/\n{2,}/).first.dup
      excerpt.gsub!(/<\/?[^>]*>/, "")
      excerpt.strip!
      return "" if excerpt.empty?

      max_length = 300
      if excerpt.length > max_length
        # Try to avoid cutting in the middle of a sentence
        # [.!?:]\s -- any of those punctuation followed by a space
        # rpartition finds the last match of that pattern and splits there
        truncated = excerpt[0...max_length]
        head, separator, = truncated.rpartition(/[.!?:"]\s/)
        # if the first sentence is > max_length, just use the entire first sentence
        excerpt = separator.empty? ? excerpt.partition(/[.!?:"]\s/).first : head
      end

      excerpt.sub!(/[.!?:"\s]+\z/, "")
      excerpt << "..."
    end
  end
end

Liquid::Template.register_filter(Jekyll::Backlinks)
Liquid::Template.register_tag("category_list", Jekyll::CategoryListTag)
Liquid::Template.register_tag("category_toc", Jekyll::CategoryListTOCTag)
Liquid::Template.register_tag("custom_excerpt", Jekyll::CustomExcerptTag)

# Add IDs to HR tags and make headers and HRs clickable anchors
Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless doc.output_ext == ".html"

  output = doc.output.to_s
  next unless output.include?("<hr") || output.match?(/<h[1-6]\b/i)

  if output.include?("<hr")
    hr_counter = 0

    output = output.gsub(/<hr\b([^>]*)\/?>/i) do
      match = Regexp.last_match[0]
      attrs = Regexp.last_match[1].to_s

      if match.include?("id=")
        match
      else
        hr_counter += 1
        "<hr#{attrs} id=\"hr-#{hr_counter}\">"
      end
    end

    output = output.gsub(
      /<hr\b([^>]*)\bid="([^"]+)"([^>]*)\/?>/i
    ) do
      md = Regexp.last_match

      pre = md[1]
      id = md[2]
      post = md[3]
      hr_tag = "<hr#{pre}id=\"#{id}\"#{post}>"

      "<a href=\"##{id}\" class=\"hr-anchor\" aria-label=\"Link to this section break\">#{hr_tag}</a>"
    end
  end

  if output.match?(/<h[1-6]\b/i)
    output = output.gsub(
      /<(h[1-6])\b([^>]*)\bid="([^"]+)"([^>]*)>(.*?)<\/\1>/m
    ) do
      md = Regexp.last_match
      tag = md[1]
      pre = md[2]
      id = md[3]
      post = md[4]
      content = md[5]

      if content.lstrip.match?(/\A<a\b/i)
        md[0]
      else
        "<#{tag}#{pre}id=\"#{id}\"#{post}><a href=\"##{id}\" class=\"header-anchor\">#{content}</a></#{tag}>"
      end
    end
  end

  doc.output = output
end
