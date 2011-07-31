(function() {
  $(document).ready(function() {
    var story_dropdown, tabs;
    tabs = $('ul.tabs') || [];
    story_dropdown = $('select#story_template');
    $('.insertion_highlighter').click(function() {
      console.log("clicked!");
      return $('.inserted').toggleClass('highlighted');
    });
    story_dropdown.val(window.location.pathname.substr(1));
    return story_dropdown.change(function(element) {
      return window.location = $(element.srcElement).val();
    });
  });
}).call(this);
