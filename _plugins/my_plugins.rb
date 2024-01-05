def titleize(string)
  nocap = ['a', 'an', 'the', 'and', 'as', 'if', 'at', 'but', 'by', 'for', 'from', 'in', 'into', 'like', 'near', 'now', 'that', 'nor', 'of', 'off', 'on', 'once', 'onto', 'or', 'over', 'past', 'so', 'than', 'till', 'to', 'up', 'upon', 'with', 'when', 'yet']
  
  array = string.split(" ").map do |word|
    if (word != word.upcase && (word == string.split(" ").first || !nocap.include?(word)))
      word.capitalize
    else
      word
    end
  end
  array.join(" ")
end

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.data["title"] = titleize(post.data["title"])
end

module Jekyll
  module Backlinks
    def backlink(input)
      backlinks = []
      site = @context.registers[:site]
      site.posts.docs.each do |post|
        if post&.content&.include? input
          backlinks << "<a href=\"#{post.url}\">#{titleize(post.data['title'])}</a>"
        end
      end
      if (backlinks.length > 0)
        return "#{backlinks.join(', ')}"
      else
        return ""
      end
    end
  end

  class CategoryListTag < Liquid::Tag
    def render(context)
      html = ""
      categories = context.registers[:site].categories
      sorted_categories = categories.sort_by { |category| category[1].size }
      sorted_categories.reverse.each do |category|
        category_name = category[0]
        html << "<div><a name=\"#{category_name}\"></a><h1>#{category_name} (#{category[1].size})</h1><ul>"
        category[1].each do |post| 
          word_count = post.content.scan(/\S+/).count
          html << '<li class="archive_link'
          html << '">'
          html << '<a class="archive_link'
          if (word_count < 300)
            html << ' short_post'
          end
          html << "\" href=\"#{post.url}\">#{post.data['title']}</a> (#{word_count}) (#{post.date.strftime("%m/%Y")})"
          html << '</li>'
        end
        html << '</div>'
      end
      html
    end
  end
end

Liquid::Template.register_filter(Jekyll::Backlinks)
Liquid::Template.register_tag('category_list', Jekyll::CategoryListTag)
