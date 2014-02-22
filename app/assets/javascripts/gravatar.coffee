class @Gravatar
  @url: =>
    gravatarId = md5(window.user.get('email'))
    defaultAvatarUrl = "http://www.qratr.fm/assets/default_artwork.jpg"
    encodedDefaultAvatarUrl = encodeURIComponent(defaultAvatarUrl)
    return "http://gravatar.com/avatar/#{gravatarId}?d=#{defaultAvatarUrl}&s=30"
