class @SignupModalView extends Backbone.View
  el: "#signupModal"

  render: =>
    if $('#signupModal').length == 1
      $('#signupModal').modal('toggle')
      return

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
