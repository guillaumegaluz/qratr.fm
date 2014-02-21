class @Gravatar
  @url: =>
    gravatarId = md5(window.user.get('email'))
    "http://gravatar.com/avatar/#{gravatarId}?s=30.png"
