class App.Meal

  constructor: () ->

  init: () ->

  createMeal: (mealId, numberOfSeats) ->
    return unless Cookies.get(mealId)?

    Cookies.set(mealId, 'Transaction Pending')

    @fudContractInstance.createMeal numberOfSeats, ->
      # we need to save the meal's address
      console.log result
      # write back to the database.
      $.put()

#   joinMeal: (mealAddress) ->
#     @fudContractInstance.joinMeal
#
#   confirmMeal: () ->
#     # this must be
#
#   closeMeal: () ->
