class @HeaderView extends Backbone.View
  el: ".header"
  events:
    'click .login': 'clickLogin'
    'click .signup': 'clickSignup'
    'click .logout': 'clickLogout'

  initialize: =>
    @render()

  render: =>
    @$el.html(JST['templates/header']())

  clickLogin: =>
    new LoginModalView().render()

  clickSignup: =>
    $modalHtml = $(JST['templates/signup']())
    $modalHtml.modal()
    $modalHtml.find('form').on 'submit', (e) =>
      e.preventDefault()
      $.ajax
        type: 'post'
        url: '/signup'
        data: {user: {username: $('form .username-field').val(), email: $('form .email-field').val(), password: $('form .password-field').val()}}
        dataType: 'json'
        success: (data) =>
          $modalHtml.modal('hide')
          window.user = new User(data)
          @render()
        error: =>
          @displayErrorNotice("Is your email valid? Is your password at least 6 characters? Maybe try a different username..")

  clickLogout: =>
    $.ajax
      type: 'get'
      url: '/logout'
      success: =>
        window.user.set('id', null)
        @render()

  displayErrorNotice: (text) =>
    $('.error-notice').html(text)
