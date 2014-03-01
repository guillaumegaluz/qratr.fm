class @PlayerMetadataView extends Backbone.View
  el: ".player-left-container"

  initialize: =>
    playerState.on('change:currentTrack', @render)

  render: =>
    @$el.html(JST['templates/player_metadata'](track: playerState.get('currentTrack')))
