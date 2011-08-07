# Skeleton V1.0.2
# Copyright 2011, Dave Gamache
# www.getskeleton.com
# Free to use under the MIT license.
# http://www.opensource.org/licenses/mit-license.php
# 5/20/2011

$(document).ready ->
  template_name = window.location.pathname.substr(1)
  story_dropdown = $('select#story_template')
  story_dropdown.val(template_name) # set dropdown to current path
  $('.story_content').addClass template_name # FIXME- do in Ruby
