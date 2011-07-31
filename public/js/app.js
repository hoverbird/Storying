(function() {
  $(document).ready(function() {
    var story_dropdown, tabs;
    tabs = $('ul.tabs') || [];
    story_dropdown = $('select#story_template');
    $('.insertion_highlighter').click(function() {
      return $('span.inserted').toggleClass('highlighted');
    });
    story_dropdown.val(window.location.pathname.substr(1));
    return story_dropdown.change(function(element) {
      return window.location = $(element.srcElement).val();
    });
  });
  tabs.each(function(i) {
    var tab;
    tab = $(this).find('> li > a');
    return tab.click(function(e) {
      var contentLocation;
      contentLocation = $(this).attr('href') + "Tab";
      if (contentLocation.charAt(0) === "#") {
        e.preventDefault();
        tab.removeClass('active');
        $(this).addClass('active');
        return $(contentLocation).show().addClass('active').siblings().hide().removeClass('active');
      }
    });
  });
}).call(this);
