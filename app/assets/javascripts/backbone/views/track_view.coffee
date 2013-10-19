class @TrackView extends Backbone.View
	events:
		'click': 'trackClicked'

	initialize: (options) =>
	  @track = options.model

	trackClicked: =>
		player.trackClicked(@track)
