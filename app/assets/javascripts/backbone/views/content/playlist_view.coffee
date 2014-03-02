class @PlaylistView extends Backbone.View
  el: '.playlist-container'

  initialize: =>
    @render()
    playerState.on 'change:displayPlaylist', @render

  render: =>
    @$el.html(JST['templates/playlist'](playlist: playerState.get('displayPlaylist')))
    @initializeTracksViews()

  initializeTracksViews: =>
    @$el.find('.track-container').each (i, trackElement) =>
      $trackElement = $(trackElement)
      track = playerState.get('displayPlaylist').get('tracks').find (t) ->
        t.get('id') == $trackElement.data('track-id')
      new TrackView(el: trackElement, model: track)
