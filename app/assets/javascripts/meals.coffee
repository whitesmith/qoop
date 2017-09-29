$(document).ready ->
  $('.meal-submit--js').click (event) ->
    event.preventDefault();
    $.get("/meals/address").done (data) ->
      address = if data["address"]? then data["address"] else null
      $('#meal_address').val(address)
      $('.meal-form--js').submit()

  $(".file-input").on 'change', ->
    filename = $(this).val().replace(/.*(\/|\\)/, '')
    $(".file-name").html(filename)