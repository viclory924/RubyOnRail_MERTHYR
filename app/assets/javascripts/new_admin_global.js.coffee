APP.init = ->
  console.log 'new_admin views'

  $("a[rel=popover]").popover()
  $(".popover").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  if $("input[type='text']")[0]?
    $("input[type='text']")[0].focus()

  tinymce.init
    toolbar: "undo redo | styleselect | bold italic | link unlink | code | image | bullist numlist"
    selector: 'textarea.my_tinymce'
    menubar: false
    height: 200
    mode: 'textareas'
    plugins: ["link image code"]
    skin_url: '/assets/skins/lightgray'
    theme_url: '/assets/themes/modern/theme.min.js'

  APP.bindDatePicker = ->
    $('.datepicker').datepicker
      format: 'dd/mm/yyyy'
      autoclose: true
