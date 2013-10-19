class @PlaylistView extends Backbone.View
	el: '.playlist-container'

	initialize: (options = {}) =>
    @playlist = options.model
    @initializeTracksViews()

  initializeTracksViews: =>
  	@$el.find('.track-container').each (i, trackElement) =>
      $trackElement = $(trackElement)
      track = @playlist.tracks.find (t) ->
        t.get('id') == $trackElement.data('track-id')
      new TrackView(el: trackElement, model: track)
