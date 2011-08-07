(function() {
  $(document).ready(function() {
    var story_dropdown, tabs, template_name;
    tabs = $('ul.tabs') || [];
    story_dropdown = $('select#story_template');
    template_name = window.location.pathname.substr(1);
    story_dropdown.val(template_name);
    $('.insertion_highlighter').click(function() {
      return $('.inserted').toggleClass('highlighted');
    });
    story_dropdown.change(function(element) {
      return window.location = $(element.srcElement).val();
    });
    return $('.story_content').addClass(template_name);
  });
}).call(this);
