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

  $('.refresher').click ->
    console.log('yeah!')
    window.location.reload(true)



  story_dropdown.change (element) ->
    window.location = $(element.srcElement).val() # Change paths on dropdown change

  $('.story_content').addClass template_name # FIXME- do in Ruby
