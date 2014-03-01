class @PlaybackButtonsView extends Backbone.View
  el: '.playback-buttons'
  events:
    'click .icon-play': 'play'
    'click .icon-pause': 'pause'
    'click .prev-track': 'previous'
    'click .next-track': 'next'

  initialize: =>
    playerState.on 'change:paused', @togglePlayPauseIcon
    playerState.on 'change:currentTrack', @render

  render: =>
    @$el.html(JST['templates/playback_buttons']())

  play: =>
    playerState.set 'paused', false

  pause: =>
    playerState.set 'paused', true

  previous: =>
    mixpanel.track("Track Click Prev");
    playerState.setPreviousTrack()

  next: =>
    mixpanel.track("Track Click Next");
    playerState.setNextTrack()

  togglePlayPauseIcon: =>
    if playerState.get('paused')
      $('.play-pause').removeClass("icon-pause").addClass("icon-play")
    else
      $('.play-pause').removeClass("icon-play").addClass("icon-pause")
