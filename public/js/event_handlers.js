(function() {
  $('.insertion_highlighter').click(function() {
    return $('.inserted').toggleClass('highlighted');
  });
  $('.refresher').click(function() {
    return window.location.reload(true);
  });
  $('select#story_template').change(function(element) {
    return window.location = $(element.srcElement).val();
  });
}).call(this);
