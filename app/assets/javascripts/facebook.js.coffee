jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  ((d, s, id) ->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    return  if d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=" + $('#fai').text()
    fjs.parentNode.insertBefore js, fjs
  ) document, "script", "facebook-jssdk"

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true

  window.fbAsyncInit = ->
    FB.init(appId: $('#fai').text(), status: true, cookie: true, xfbml: true, oauth: true)

    $('#subscribe_with_facebook').click (e) ->
      e.preventDefault()
      FB.login (response) ->
        window.location = '/auth/facebook/callback' if response.authResponse
      ,
        scope: 'email,publish_stream,offline_access'
