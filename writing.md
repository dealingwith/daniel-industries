{% for piece in site.writing %}
  <h2>
    <a href="{{ piece.url }}">
      {{ piece.title }} // {{ piece.category }}
    </a>
  </h2>
{% endfor %}
