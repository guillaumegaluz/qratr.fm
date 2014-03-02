class @PageTitleView extends Backbone.View
  initialize: =>
    playerState.on 'change:paused', @togglePageTitle
    playerState.on 'change:currentTrack', @togglePageTitle

  togglePageTitle: =>
    if playerState.get('paused')
      document.title = "Qratr.fm"
    else
      document.title = "▶ #{playerState.get('currentTrack').get('artist')} - #{playerState.get('currentTrack').get('title')}"
      
