class @SubscribeView extends Backbone.View
  el: '.subscribe'
  events:
    'click .subscribe-button': 'checkEmail'

  initialize: =>
    if !localStorage.getItem('hasSubscribed')
      $('.subscribe').show(0)

  checkEmail: => 
    email = $('.subscribe-input').val()
    if @emailIsValid(email)
      @saveEmail(email)
    else
      @displayErroMessage()

  saveEmail: (email) =>
    data = {"email": email}
    $.ajax
      url: '/subscriber'
      type: 'post'
      data: data
      dataType: 'json'
      success: @displayConfirmationMessage()

  displayConfirmationMessage: =>
    $('.subscribe').html(JST['templates/subscribed']())
    localStorage.setItem('hasSubscribed', true)

  displayErroMessage: =>
    $('.subscribe-form input').css('border', '2px solid rgb(241, 144, 144)')

  emailIsValid: (string) =>
    emailPattern = /// ^ #begin of line
      ([\w.-]+)         #one or more letters, numbers, _ . or -
      @                 #followed by an @ sign
      ([\w.-]+)         #then one or more letters, numbers, _ . or -
      \.                #followed by a period
      ([a-zA-Z.]{2,6})  #followed by 2 to 6 letters or periods
      $ ///i            #end of line and ignore case
    return string.match emailPattern
