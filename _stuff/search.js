var client = algoliasearch("ICRBGMD5ZS", "ae81d6ae139fe6152fdd07d71a8cbce5");
var index = client.initIndex('danielsjourney');

function search(term) {
  index.search(term, {hitsPerPage: 200}, function searchDone(err, content) {
    console.log(content.hits.length);
    $results = $('main')
    $results.empty();
    content.hits.forEach(function(suggestion){
      var title = suggestion.title;
      var raw_html = suggestion.raw_html;
      var url = suggestion.url.match(/\/\d{4}\/\d{2}\/\d{2}\/.*[^\/]/) + '.html';
      $results.show().prepend(`
        <article class="post">
          <h1 class="post-title"><a href="${url}">${title}</a></h1>
          ${raw_html}
        </article>
      `);
    });
    $results.append('<article class="post"><h1><a href="/">Reset</a></h1></article>');
  });
}

$(function() {
  $('#aa-search-input').on('search', function(input) {
    if (input.target.value)
      search(input.target.value);
    else
      location.reload();
  });
});
