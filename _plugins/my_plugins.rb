require "titleize"

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.data["title"].titleize!
end
