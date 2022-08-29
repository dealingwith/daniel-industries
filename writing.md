---
layout: page
title: "Writing"
date: 2022-05-14 07:09
---

{% assign sorted_array = site.writings | sort: "pubdate" | reverse %}
{% for piece in sorted_array %}
  <h3>
    <a href="{{ piece.url }}" class="writing-link">{{ piece.title }}</a>
  </h3>
  
  <p class="post-metadata">{% if piece.pubdate %}{{ piece.pubdate }}{% endif %} / {{ piece.content | number_of_words }} words / {{ piece.category }} / {% if piece.subcategory %}{{ piece.subcategory }}{% endif %}</p>
    
  > {{ piece.excerpt }} [→]({{piece.url}})

  ---
{% endfor %}