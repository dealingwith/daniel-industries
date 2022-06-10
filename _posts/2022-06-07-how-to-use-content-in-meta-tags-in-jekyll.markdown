---
layout: post
title: "How to use content in meta tags in Jekyll"
date: 2022-06-07 07:41:07 -0500
categories: 
---

![](/assets/2022/06/carbon.png)

Stack Overflow: [In Jekyll How do I grab a post's first image?](https://stackoverflow.com/questions/25463865/in-jekyll-how-do-i-grab-a-posts-first-image) A lot of different answers to this one, but I went with an answer that was not the "accepted" answer: [installing a Liquid regex gem/plugin](https://stackoverflow.com/a/40860579/5221). I only had one improvement. Here are the steps and final code I landed with:

Per the instructions, install the gem and add it to Jekyll's plugin list. I use bundler to manage gems for this site, so I just added it to my Gemfile.rb.

```rb
gem "match_regex"
```

```yml
plugins:
  - match_regex
```

And then I refactored the example liquid from SO a little bit, since the `capture` wasn't necessary, as the variable was being assigned already:

```liquid
{% raw %}{% assign hero_image = page.content | match_regex: '<img .*?src="([^"]+)"' %}
{% if hero_image == nil %}
  {% assign hero_image = "/assets/page/DSC_4899-copy.jpg" %}
{% endif %}
{% assign hero_image = hero_image | prepend: site.url %}{% endraw %}
```

Then I needed some extra logic to conditionally grab some other metadata:

```liquid
{% raw %}{% capture title %}
  {% if page.title %}
    {{ page.title }}
  {% else %}
    {{ site.title }}
  {% endif %}
{% endcapture %}

{% capture description %}
  {% if page.excerpt %}
    {{ page.excerpt | strip_html | escape }}
  {% else %}
    {{ site.tagline }}
  {% endif %}
{% endcapture %}{% endraw %}
```

_Then_ I used [snaplink.dev](https://snaplink.dev/) to generate an image for the `og:image` tag:

```html
{% raw %}<title>{{ title }}</title>
<meta name="description" content="{{ description | strip }}">
<meta property="og:title" content="{{ title | strip }}" />
<meta property="og:description" content="{{ description | strip }}" />
<meta property="og:image" content="https://img.snaplink.dev/59d2d71912/?title={{ title | strip | url_encode }}&excerpt={{ description | strip | url_encode }}&image={{ hero_image | url_encode }}&w=1200&h=630" />{% endraw %}
```
