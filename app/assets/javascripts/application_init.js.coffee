# Garber-Irish style of controller and action-based javasript execution

@PUBLIC_APP = {}

Executioner =
  exec: (controller, action) ->
    ns = PUBLIC_APP
    action = (if (action is `undefined`) then "init" else action)
    ns[controller][action]() if controller isnt "" and ns[controller] and typeof ns[controller][action] is "function"

  init: ->
    body = document.body
    #controller = body.getAttribute("data-controller")
    controller = 'pages'
    action = body.getAttribute("data-action")
    PUBLIC_APP.init() if typeof PUBLIC_APP.init is "function"
    Executioner.exec controller
    Executioner.exec controller, action

$(document).ready Executioner.init
