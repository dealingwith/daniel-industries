---
layout: page
title: "Writing"
date: 2022-05-14 07:09
---

{% assign sorted_array = site.writings | sort: "pubdate" | reverse %}
{% for piece in sorted_array %}
  <div class="blog-index-div">
    <h3>
      <a href="{{ piece.url }}">{{ piece.title }}</a>
    </h3>
    
    <div class="post-metadata">{% if piece.pubdate %}{{ piece.pubdate }}{% endif %} / {{ piece.content | number_of_words }} words / {{ piece.category }} / {% if piece.subcategory %}{{ piece.subcategory }}{% endif %}</div>
      
    <p class="small">{{ piece.excerpt }}</p>
  </div>
{% endfor %}
