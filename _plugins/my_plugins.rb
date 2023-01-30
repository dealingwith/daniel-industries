require "titleize"

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.data["title"].titleize!
end

# Jekyll::Hooks.register :posts, :pre_render do |post|
#   post.data["related_posts"] ||= []
#   site = @context.registers[:site]
#   site.posts.each do |p|
#     if p.content =~ /#{page.url}/i
#       post.data["related_posts"] << p
#     end
#   end
# end

module Jekyll
  module Backlinks
    def backlink(input)
      backlinks = []
      site = @context.registers[:site]
      site.posts.docs.each do |post|
        if post&.content&.include? input
          backlinks << "<a href=\"#{post.url}\">#{post.data['title'].titleize!}</a>"
        end
      end
      if (backlinks.length > 0)
        return "Backlinks: #{backlinks.join(', ')}"
      else
        return ""
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Backlinks)
