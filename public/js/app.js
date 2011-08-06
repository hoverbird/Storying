(function() {
  $(document).ready(function() {
    var circle, diagonal, diagonal2, paper, story_dropdown, tabs, template_name;
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
    $('.story_content').after($('<div id="notepad"></div>'));
    $('.story_content').addClass(template_name);
    Raphael.fn.arrow = function(x1, y1, x2, y2, size) {
      var a135, a135m, a45, a45m, angle, x1a, x1b, x2a, x2b, y1a, y1b, y2a, y2b;
      angle = Raphael.angle(x1, y1, x2, y2);
      a45 = Raphael.rad(angle - 45);
      a45m = Raphael.rad(angle + 45);
      a135 = Raphael.rad(angle - 135);
      a135m = Raphael.rad(angle + 135);
      x1a = x1 + Math.cos(a135) * size;
      y1a = y1 + Math.sin(a135) * size;
      x1b = x1 + Math.cos(a135m) * size;
      y1b = y1 + Math.sin(a135m) * size;
      x2a = x2 + Math.cos(a45) * size;
      y2a = y2 + Math.sin(a45) * size;
      x2b = x2 + Math.cos(a45m) * size;
      y2b = y2 + Math.sin(a45m) * size;
      return this.path("M" + x1 + " " + y1 + "L" + x1a + " " + y1a + "M" + x1 + " " + y1 + "L" + x1b + " " + y1b + "M" + x1 + " " + y1 + "L" + x2 + " " + y2 + "M" + x2 + " " + y2 + "L" + x2a + " " + y2a + "M" + x2 + " " + y2 + "L" + x2b + " " + y2b);
    };
    paper = Raphael(document.getElementById('notepad'), 320, 200);
    circle = paper.circle(50, 40, 10);
    diagonal = paper.path("M28 10L90 90");
    diagonal2 = diagonal.clone;
    return paper.arrow(10, 10, 30, 30, 5).attr({
      fill: "#f00"
    });
  });
}).call(this);
