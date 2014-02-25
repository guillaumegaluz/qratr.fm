class @TrackView extends Backbone.View
  events:
    'click': 'trackClicked'

  initialize: (options) =>
    @track = options.model

  trackClicked: =>
    mixpanel.track("Track Click");
    window.player.trackClicked(@track)
