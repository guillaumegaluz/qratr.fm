class @HeaderView extends Backbone.View
  el: ".header"
  events:
    'click .login': 'clickLogin'
    'click .signup': 'clickSignup'

  clickLogin: =>
    console.log "clickLogin"

  clickSignup: =>
    console.log "clickSignup"
