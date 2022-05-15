---
layout: page
title: "Writing"
date: 2022-05-14 07:09
---

{% for piece in site.writings %}
  <div class="writing-index-container">
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
