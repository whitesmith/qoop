# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.js-form-buy-fud').click ->
    volume = $('[data-buy-volume]').val()
    window.fud.buy(volume)

    $('.js-notification').find('.notification-text').text('Transaction submitted successfully')
    $('.js-notification').show()

  $('.js-form-sell-fud').click ->
    volume = $('[data-sell-volume]').val()
    window.fud.sell(volume)

    $('.js-notification').find('.notification-text').text('FUD selled with success')
    $('.js-notification').show()
