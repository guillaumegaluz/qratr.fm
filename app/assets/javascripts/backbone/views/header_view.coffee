class @HeaderView extends Backbone.View
  el: ".header"
  events:
    'click .login': 'clickLogin'
    'click .signup': 'clickSignup'
    'click .logout': 'clickLogout'

  initialize: =>
    @render()

  render: =>
    @$el.html(JST['templates/old_header']())
    # New header w Login and Signup @$el.html(JST['templates/header']())

  clickLogin: =>
    window.loginModalView.render()

  clickSignup: =>
    window.signupModalView.render()

  clickLogout: =>
    $.ajax
      type: 'get'
      url: '/logout'
      success: =>
        window.user = new User()
        @render()
