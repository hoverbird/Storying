(function() {
  $(document).ready(function() {
    var story_dropdown, template_name;
    template_name = window.location.pathname.substr(1);
    story_dropdown = $('select#story_template');
    story_dropdown.val(template_name);
    return $('.story_content').addClass(template_name);
  });
}).call(this);
