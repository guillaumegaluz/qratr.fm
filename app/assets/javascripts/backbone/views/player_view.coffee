class @PlayerView extends Backbone.View
  el: "#player"
  events:
    'click .playerPlay': 'clickPlayPause'

  clickPlayPause: =>
    player.clickPlayPause()
