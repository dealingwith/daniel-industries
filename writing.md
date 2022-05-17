---
layout: default-index
title: "Writing"
date: 2022-05-14 07:09
---

{% assign sorted_array = site.writings | sort: "category" %}
{% for piece in sorted_array %}
  <div class="item main-content">
    <div class="writing-index-category">
      {{ piece.subcategory }}
    </div>
    <div class="writing-index-category">
      {{ piece.category }}
    </div>
    <div>
      <span class="writing-index-title">
        <a href="{{ piece.url }}" class="writing-link">{{ piece.title }}</a>
      </span>
    </div>
    <p class="writing-index-excerpt"><a href="{{ piece.url }}" class="writing-link">{{ piece.excerpt }}</a></p>
  </div>
{% endfor %}
