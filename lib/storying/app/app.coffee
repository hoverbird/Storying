# Skeleton V1.0.2
# Copyright 2011, Dave Gamache
# www.getskeleton.com
# Free to use under the MIT license.
# http://www.opensource.org/licenses/mit-license.php
# 5/20/2011

$(document).ready ->
  tabs = $('ul.tabs') || []
  story_dropdown = $('select#story_template')
  template_name = window.location.pathname.substr(1)
  story_dropdown.val(template_name) # set dropdown to current path

  # event handlers
  $('.insertion_highlighter').click ->
    $('.inserted').toggleClass('highlighted')

  story_dropdown.change (element) ->
    window.location = $(element.srcElement).val() # Change paths on dropdown change

  $('.story_content').after($('<div id="notepad"></div>'))
  $('.story_content').addClass template_name # FIXME- do in Ruby

  Raphael.fn.arrow = (x1, y1, x2, y2, size) ->
    angle = Raphael.angle(x1, y1, x2, y2)
    a45   = Raphael.rad(angle-45)
    a45m  = Raphael.rad(angle+45)
    a135  = Raphael.rad(angle-135)
    a135m = Raphael.rad(angle+135)
    x1a = x1 + Math.cos(a135) * size
    y1a = y1 + Math.sin(a135) * size
    x1b = x1 + Math.cos(a135m) * size
    y1b = y1 + Math.sin(a135m) * size
    x2a = x2 + Math.cos(a45) * size
    y2a = y2 + Math.sin(a45) * size
    x2b = x2 + Math.cos(a45m) * size
    y2b = y2 + Math.sin(a45m) * size
    @path(
      "M"+x1+" "+y1+"L"+x1a+" "+y1a+
      "M"+x1+" "+y1+"L"+x1b+" "+y1b+
      "M"+x1+" "+y1+"L"+x2+" "+y2+
      "M"+x2+" "+y2+"L"+x2a+" "+y2a+
      "M"+x2+" "+y2+"L"+x2b+" "+y2b
    )

  paper = Raphael document.getElementById('notepad'), 320, 200
  circle = paper.circle 50, 40, 10
  diagonal = paper.path "M28 10L90 90"

  diagonal2 = diagonal.clone
  # diagonal2.rotate 45
  # diagonal2.insertAfter diagonal
  # diagonal2.rotate 180

  paper.arrow(10, 10, 30, 30, 5).attr({fill: "#f00"});


  #   # Tabs Activation
  # tabs.each (i) ->
  #     # Get all tabs
  #   tab = $(this).find('> li > a')
  #   tab.click (e) ->
  #       # Get Location of tab's content
  #     contentLocation = $(this).attr('href') + "Tab";
  #
  #       # Let go if not a hashed one
  #     if contentLocation.charAt(0) == "#"
  #       e.preventDefault()
  #
  #         # Make Tab Active
  #       tab.removeClass('active')
  #       $(this).addClass('active')
  #
  #         # Show Tab Content & add active class
  #       $(contentLocation).show().addClass('active').siblings().hide().removeClass('active')
  #
