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

  $('.story_content').addClass template_name # FIXME- do in Ruby

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
