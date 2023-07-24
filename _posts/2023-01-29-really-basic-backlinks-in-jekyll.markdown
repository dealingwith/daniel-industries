---
layout: post
title: "Really basic backlinks in Jekyll"
excerpt:
date: 2023-01-29 10:21:47 -0600
categories:
---

I've wanted to generate backlinks -- a section on each post showing other posts that link to it -- for some time. I was looking for something interesting to do at the computer last night and clicked on the _Frog Boils_ view of my Notion tasks database. (That is simply a view sorted by task age, oldest to newest.) Near the top (i.e. one of the oldest, at 262 days old) was Jekyll backlinks.

Surely someone had accomplished this, I thought, and began my search. I discovered [simple-jekyll](https://github.com/raghudotcc/simply-jekyll), which is [gorgeous in practice](https://raghu.cc/). I forked it and tried to piece together how its backlinks worked. After some time, I decided that extracting just the backlinks functionality was going to be too difficult, so I put it aside for now. I may still play with implementing the theme in its entirety and see how it handles my 3000+ post blog.

I then found [this gist](https://gist.github.com/xplosionmind/605e4a2a67ec704dfb738d9d6b984941) titled _Pure Liquid Jekyll Backlinks_. This one I grokked pretty easily, so I implemented it. I then ran the Jekyll build command and waited. And waited some more. And got up and washed my face. And brushed my teeth. And waited some more. Finally I killed the build process. I then tried building just 10 posts. That went much better. As did 100. But clearly this wasn't going to be a tenable option for over 3000 posts.

This is a classic N+1 problem. For every post I build, I have to hunt through all the other 3000 posts for links to that post.

Let's say 10 posts took 1 second to generate. 10^2: 100

100^2: 10,000 would take almost 1.7 minutes, which it did not at all, so there are some efficiencies at play here.

3000^2: 9,000,000 would, in theory, take a little over a day, so I'm glad I didn't wait. (Assuming my math is correct, which I never assume when it matters.)

On to plan B: write a plugin. This wouldn't solve for the N+1 problem, but I suspected a solution written in Ruby would be faster than its Liquid equivalent (despite [Liquid being written in, of course, Ruby](https://github.com/Shopify/liquid)). I'd written a simple plugin already to titleize all my post titles, something like this:

```rb
Jekyll::Hooks.register :posts, :pre_render do |post|
  post.data["title"].titleize!
end
```

The post pre_render hook doesn't have access to all the posts, as far as I could determine. A lot of reading blog posts and plugin code led me to try a Liquid filter plugin:

```rb
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
```

Implemented thusly:

{% raw %}
<code>
{{ page.url | backlink }}
</code>
{% endraw %}

This method resulted in no slowdown of build time. It takes about 30 seconds to build my site.

Not particularly flexible, but it gets the job done. Refinements forthcoming. But as I had yet to find any reasonable backlinks solution for Jekyll, I thought I would post about it in the meantime.

An example of a post with backlinks would [this one]({{site.url}}/2022/05/08/the-hospital/).
