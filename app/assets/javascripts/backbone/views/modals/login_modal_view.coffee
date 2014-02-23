class @LoginModalView extends Backbone.View
  el: "#loginModal"

  render: =>
    if $('#loginModal').length == 1
      $('#loginModal').modal('toggle')
      return

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
          window.headerView.render()
        error: =>
          @displayErrorNotice("Sorry, we couldn't find an account with that username. Do you mind trying again?")
    $modalHtml.find('.forgot-password').on 'click', (e) =>
      e.preventDefault()
      $('#loginModal').html(JST['templates/forgot_password']())
      $modalHtml.find('.close').on 'click', (e) =>
        $modalHtml.remove()
        $('.modal-backdrop').remove()

  displayErrorNotice: (text) =>
    $('.error-notice').html(text)
