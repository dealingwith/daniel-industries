---
layout: default-index
title: "Writing"
date: 2022-05-14 07:09
---
<script>
  function showHide(classname) {
    document.querySelectorAll(".item." + classname).forEach(function(el) {
      el.style.display = "block";
    });
    document.querySelectorAll(".item:not(." + classname + ")").forEach(function(el) {
      el.style.display = "none";
    });
  }
  function showAll() {
    document.querySelectorAll(".item").forEach(function(el) {
      el.style.display = "block";
    });
  }
</script>
<div style="width: 100%; margin-bottom: 2rem; margin-top: -1rem">
  <a href="#" onclick="showHide('Fiction')">Fiction</a> /
  <a href="#" onclick="showHide('Nonfiction')">Nonfiction</a> /
  <a href="#" onclick="showAll()">All</a>
</div>

{% assign sorted_array = site.writings | sort: "subcategory" %}
{% for piece in sorted_array %}
  <div class="item {{ piece.subcategory }} {{ piece.category }}">
    {% if piece.subcategory %}
      <div class="writing-index-category">
        {{ piece.subcategory }}
      </div>
    {% endif %}
    <div class="writing-index-category">
      {{ piece.category }}
    </div>
    <div class="writing-index-title">
      <a href="{{ piece.url }}" class="writing-link">{{ piece.title }}</a>
    </div>
    {% if piece.pubdate %}
      <p class="post-metadata">{{ piece.pubdate }} / {{ piece.content | number_of_words }} words</p>
    {% endif %}
    <p class="writing-index-excerpt"><a href="{{ piece.url }}" class="writing-link">{{ piece.excerpt }}</a></p>
  </div>
{% endfor %}
