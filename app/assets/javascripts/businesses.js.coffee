# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

APP.businesses =
  edit: ->
    APP.businesses.taggable()

  new: ->
    APP.businesses.taggable()

  taggable: ->
    $('#business_services').tagsInput
      'defaultText': 'add a tag'
