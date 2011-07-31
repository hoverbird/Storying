(function() {
  $(document).ready(function() {
    var tabs;
    tabs = $('ul.tabs');
    return tabs.each(function(i) {
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
  });
}).call(this);
