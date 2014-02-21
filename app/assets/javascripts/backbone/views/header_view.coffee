class @HeaderView extends Backbone.View
  el: ".header"
  events:
    'click .login': 'clickLogin'
    'click .signup': 'clickSignup'

  initialize: =>
    @render()

  render: =>
    @$el.html(JST['templates/header']())

  clickLogin: =>
    $modalHtml = $(JST['templates/login']())
    $modalHtml.modal()
    $modalHtml.find('form').on 'submit', (e) =>
      e.preventDefault()
      $.ajax
        type: 'post'
        url: '/login'
        data: {email: $('form .email-username-field').val(), password: $('form .password-field').val()}
        dataType: 'json'
        success: (data) =>
          $modalHtml.modal('hide')
          window.user = new User(data)
          @render()
        error: =>
          console.log "OOPS"

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
          console.log "OOPS"

