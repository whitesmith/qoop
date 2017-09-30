$(document).ready ->
  $('.meal-submit--js').click (event) ->
    event.preventDefault();
    # TODO this get should be to the block chain
    $.get("/meals/address").done (data) ->
      address = if data["address"]? then data["address"] else null
      $('#meal_address').val(address)
      $('.meal-form--js').submit()

  $(".file-input").on 'change', ->
    filename = $(this).val().replace(/.*(\/|\\)/, '')
    $(".file-name").html(filename)

  $('.js-form-join-meal').click ->
    event.preventDefault();
    # TODO this get should be to the block chain
    $.get("/meals/address").done (data) ->
      $('.join-meal--form').submit()

  $('.js-form-confirm-meal').click ->
    event.preventDefault();
    # TODO this get should be to the block chain
    $.get("/meals/address").done (data) ->
      $('#confirm-meal-modal').removeClass('is-active')
      alert('confirm')
      $('.js-notification').find('.notification-text').text('Meal confirmed with success')
      $('.js-notification').show()

  $('.js-form-close-meal').click ->
    event.preventDefault();
    # TODO this get should be to the block chain
    $.get("/meals/address").done (data) ->
      $('#close-meal-modal').removeClass('is-active')
      alert('close')
      $('.js-notification').find('.notification-text').text('Meal closed with success')
      $('.js-notification').show();

  $("#meal_tags").tagsInput();
