class @SubscribeView extends Backbone.View
  el: '.subscribe'
  events:
    'click .subscribe-button': 'saveEmail'

  saveEmail: =>
    email = $('.subscribe-input').val()
    data = {"email": email}
    $.ajax
      url: '/subscriber'
      type: 'post'
      data: data
      dataType: 'json'
      success: @displayConfirmationMessage()

  displayConfirmationMessage: =>
    $('.subscribe').html(JST['templates/subscribed']())
