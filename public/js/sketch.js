(function() {
  var circle, diagonal, paper, random;
  Raphael.fn.randomColor = function() {
    return '#' + Math.floor(Math.random() * 16777215).toString(16);
  };
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
  Raphael.fn.randomCircle = function() {
    var radius, x, y;
    radius = random(20);
    x = random(paper.width / 2 - radius);
    y = random(paper.height / 2 + radius);
    return paper.circle(x, y, radius).attr({
      fill: paper.randomColor()
    });
  };
  random = function(max) {
    return Math.floor(Math.random() * max);
  };
  paper = Raphael(document.getElementById('notepad'));
  diagonal = paper.path("M" + (random(paper.width)) + " " + (random(paper.height)) + "L" + (random(paper.height)) + " " + (random(90)) + " z");
  circle = paper.randomCircle();
  console.log('paper', paper.height, paper.width);
}).call(this);
