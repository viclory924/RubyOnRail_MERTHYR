PUBLIC_APP.init = ->
  console.log 'public views'

  $('.fancybox').fancybox({})

  $('.iframe').fancybox
    type: 'iframe'

  if $('#business_category_carousel').length != 0
    $('#business_category_carousel').carouFredSel
      responsive: true
      items:
        height: 332
        width: 360
      scroll:
        items: 1
        duration: 800
        pauseOnHover: true
        fx: 'fade'
      auto:
        play: true

  if $('#visiting_carousel').length != 0
    $('#visiting_carousel').carouFredSel
      responsive: true
      items:
        height: 350
        width: 1164
      scroll:
        items: 1
        duration: 500
        pauseOnHover: true
        fx: 'fade'
      auto:
        play: true

  $('#update-guides-form input[type=checkbox]').on 'click', (e) ->
    $('#update-guides-form').submit()

  $("input.uniform").uniform()
