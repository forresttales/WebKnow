# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  new PosterLogoCropper()

class PosterLogoCropper
  constructor: ->
    $('#cropbox_poster').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 500, 500]
      onSelect: @update_poster
      onChange: @update_poster
  
  update_poster: (coords) =>
    $('#publisher_journalposter_logo_crop_x').val(coords.x)
    $('#publisher_journalposter_logo_crop_y').val(coords.y)
    $('#publisher_journalposter_logo_crop_w').val(coords.w)
    $('#publisher_journalposter_logo_crop_h').val(coords.h)
    @updatePreview_poster(coords)

  updatePreview_poster: (coords) =>
    $('#preview_poster').css
      width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
