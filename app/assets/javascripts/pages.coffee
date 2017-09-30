# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.js-form-buy-fud').click ->
    # TODO this get should be to the block chain
    alert('buy food')
    $('.js-notification').find('.notification-text').text('FUD buyed with success')
    $('.js-notification').show()

  $('.js-form-sell-fud').click ->
    # TODO this get should be to the block chain
    alert('sell food')
    $('.js-notification').find('.notification-text').text('FUD selled with success')
    $('.js-notification').show()