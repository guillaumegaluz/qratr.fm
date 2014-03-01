class @TrackView extends Backbone.View
  events:
    'click': 'setCurrentTrack'

  initialize: =>
    playerState.on 'change:currentTrack', @updateTrackView
    playerState.on 'change:displayPlaylist', @updateTrackView

  setCurrentTrack: =>
    playerState.set 'currentPlaylist', playerState.get 'displayPlaylist'
    playerState.set 'currentTrack', @.model

  updateTrackView: =>
    @resetAllTrackContainers()
    if playerState.get('currentTrack')
      $trackContainer = $(".track-container[data-track-id=#{playerState.get('currentTrack').get('id')}]")
      $trackContainer.addClass('active')

  resetAllTrackContainers: =>
    $(".track-container").each (i, trackContainerEl) =>
      $(trackContainerEl).removeClass('active')
