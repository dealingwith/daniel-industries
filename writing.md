---
layout: default-index
title: "Writing"
date: 2022-05-14 07:09
---

{% assign sorted_array = site.writings | sort: "category" %}
{% assign previous_subcategory = "foo" %}
{% for piece in sorted_array %}
  <div class="item main-content">
    <div class="writing-index-category">
      {{ piece.subcategory }}
    </div>
    <div class="writing-index-category">
      {{ piece.category }}
    </div>
    <div>
      <a href="{{ piece.url }}" class="writing-index-title">
        {{ piece.title }}
      </a>
    </div>
    <p class="writing-index-excerpt">{{ piece.excerpt }}</p>
  </div>
{% endfor %}
