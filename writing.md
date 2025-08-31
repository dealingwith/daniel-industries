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
    
    <div class="post-metadata">
      {% if piece.pubdate %}
        {{ piece.pubdate }}
      {% endif %}
      / 
      {{ piece.content | number_of_words }} words / 
      {{ piece.category }} / 
      {% if piece.subcategory %}
        {{ piece.subcategory }}
      {% endif %}
    </div>
      
    <p class="small">{{ piece.excerpt }}</p>
  </div>
{% endfor %}

# Short Fiction on the Blog
{% assign fiction_posts = site.posts | where: "categories", "fiction" %}
{% for post in fiction_posts  %}
  {% assign post_categories = post.categories | where_exp: "category", "category != 'fiction'" %}
  <div class="blog-index-div">
    <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
    <p class="post-metadata">
      <time
          datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y" }}</time> / {{ post.content | number_of_words }} words
          {% if post_categories.size > 0 %} 
            {% for category in post_categories %} 
              / {{ category | titleize }}
            {% endfor %}
          {% endif %}
    </p>
    <p class="small">
      {% custom_excerpt post %}
    </p>
  </div>
{% endfor %}
