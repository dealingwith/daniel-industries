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
end

Liquid::Template.register_filter(Jekyll::Backlinks)
