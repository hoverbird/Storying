$('.insertion_highlighter').click ->
  $('.inserted').toggleClass('highlighted')

$('.refresher').click ->
  window.location.reload(true)

$('select#story_template').change (element) ->
  window.location = $(element.srcElement).val() # Change paths on dropdown change