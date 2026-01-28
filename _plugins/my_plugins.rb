def titleize(string)
  nocap = ["a", "an", "the", "and", "as", "if", "at", "but", "by", "for", "from", "in", "into", "like", "near", "now", "that", "nor", "of", "off", "on", "once", "onto", "or", "over", "past", "so", "than", "till", "to", "up", "upon", "with", "when", "yet"]

  array = string.split(" ").map do |word|
    if (word != word.upcase && (word == string.split(" ").first || !nocap.include?(word)))
      word.sub(/\S/, &:upcase)
    else
      word
    end
  end
  array.join(" ")
end

# Jekyll::Hooks.register :posts, :pre_render do |post|
#   post.data["title"] = titleize(post.data["title"])
# end

Jekyll::Hooks.register :site, :pre_render do |site|
  site.posts.docs.each do |post|
    post.data["title"] = titleize(post.data["title"])
  end
end

def format_category_name(category_name)
  category_name.gsub(/-|_/, " ")
end

def format_name_for_url(category_name)
  category_name.gsub(/_|\s/, "").downcase
end

module Jekyll
  module Backlinks
    # Returns array of backlink hashes with url, title, date, and word_count
    def backlinks_array(input)
      backlinks = []
      site = @context.registers[:site]
      site.posts.docs.each do |post|
        if post&.content&.include? input
          backlinks << {
            "url" => post.url,
            "title" => post.data["title"],
            "date" => post.date,
            "word_count" => post.content.scan(/\S+/).count,
            "categories" => post.data["categories"] || []
          }
        end
      end
      backlinks
    end

    # Legacy filter for backwards compatibility - returns comma-separated HTML string
    def backlink(input)
      backlinks = []
      site = @context.registers[:site]
      site.posts.docs.each do |post|
        if post&.content&.include? input
          backlinks << "<a href=\"#{post.url}\">#{post.data["title"]}</a>"
        end
      end
      if (backlinks.length > 0)
        return "#{backlinks.join(", ")}"
      else
        return ""
      end
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
      html = ""
      categories = context.registers[:site].categories
      sorted_categories = categories.sort_by { |category| category[1].size }
      
      sorted_categories.reverse.each do |category|
        category_name = category[0]
        next if category_name.nil? || category_name.strip.empty?
        
        formatted_category_name = format_category_name(category_name)
        post_count = category[1].size
        
        posts = category[1].map do |post|
          {
            word_count: post.content.scan(/\S+/).count,
            url: post.url,
            title: post.data["title"],
            date: post.date.strftime("%m/%Y")
          }
        end
        
        html << CATEGORY_TEMPLATE.result(binding)
      end
      html
    end
  end

  class CategoryListTOCTag < Liquid::Tag
    def render(context)
      html = ""
      categories = context.registers[:site].categories
      # puts "Total categories found: #{categories.length}"
      # puts "Categories: #{categories.map(&:first).join(", ")}"
      sorted_categories = categories.sort_by { |category| category[1].size }
      # Remove this line to show all categories:
      # sorted_categories = sorted_categories.delete_if { |category| category[1].size < 6 }
      
      # Or change the threshold:
      # sorted_categories = sorted_categories.delete_if { |category| category[1].size < 3 }
      
      sorted_categories.reverse.each do |category|
        category_name = category[0]
        # puts "Processing category: '#{category_name}' (#{category_name.class}) with #{category[1].size} posts"
        
        if category_name.nil? || category_name.strip.empty?
          # puts "Skipping empty/nil category"
          next
        end
        
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

      stripped_excerpt = post["excerpt"].gsub(/<\/?[^>]*>/, "")

      # if excerpt and stripped_excerpt are the same, it was probably the YAML excerpt which I want to use regardless of length...unless it was an empty string...
      if stripped_excerpt.length > 0 && post["excerpt"] === stripped_excerpt
        return post["excerpt"]
      end

      unless stripped_excerpt && stripped_excerpt.chomp.length > 0
        stripped_excerpt = post["content"].gsub(/<\/?[^>]*>/, "")
      end

      max_length = 200
      if stripped_excerpt.length > max_length
        truncated_excerpt = stripped_excerpt[0...max_length]
        truncated_excerpt = truncated_excerpt.rpartition(/(?<=[.!?:])\s/).first
      else
        truncated_excerpt = stripped_excerpt
      end
      truncated_excerpt = truncated_excerpt.chomp().sub(/[.!?:"\s]+$/, "")
      "#{truncated_excerpt}..."
    end
  end
end

Liquid::Template.register_filter(Jekyll::Backlinks)
Liquid::Template.register_tag("category_list", Jekyll::CategoryListTag)
Liquid::Template.register_tag("category_toc", Jekyll::CategoryListTOCTag)
Liquid::Template.register_tag("custom_excerpt", Jekyll::CustomExcerptTag)

# Add IDs to HR tags to make them linkable anchors
Jekyll::Hooks.register [:posts, :pages, :documents], :post_render do |doc|
  # Only process HTML output
  if doc.output_ext == ".html"
    hr_counter = 0

    # Find all <hr> tags without id attributes and add numbered IDs
    doc.output = doc.output.gsub(/<hr\s*\/?>/) do |match|
      # Check if this hr already has an id attribute (from HTML source)
      if match.include?('id=')
        match
      else
        hr_counter += 1
        "<hr id=\"hr-#{hr_counter}\">"
      end
    end
  end
end
