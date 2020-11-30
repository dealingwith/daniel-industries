---
layout: post
title: "Title case all posts in Jekyll"
excerpt: "Because I couldn't find it anywhere on the web"
date: 2017-07-26 21:54:24 -0500
comments: true
categories: 
---

After [messing around with the design of this blog the other day](/2017/07/23/new-design/), I decided I needed to title case all my post titles, because I'm terrible about consistency in that area. I did my best googling, and did not find any suitable answer, so I'm providing one here.

Install the [titleize](https://rubygems.org/gems/titleize/versions/1.4.1) Ruby gem. Then in `_plugins/my_plugins.rb`, add a `pre_render` [hook](https://jekyllrb.com/docs/plugins/#hooks) (I tried [tags](https://jekyllrb.com/docs/plugins/#tags) but failed to get them to work).

```ruby
require "titleize"

Jekyll::Hooks.register :posts, :pre_render do |post|
  post.data["title"].titleize!
end
```