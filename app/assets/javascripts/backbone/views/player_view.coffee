class @PlayerView extends Backbone.View
  el: "#player"
  events:
    'click .playerPlay': 'clickPlayPause'

  initialize: =>
    @bindKeyboardEvents()

  clickPlayPause: =>
    player.clickPlayPause()

  bindKeyboardEvents: =>
    $(window).on 'keypress', (e) ->
      e.preventDefault()
      player.clickPlayPause() if e.keyCode == 32
      player.playPrev() if e.keyCode == 112
      player.playNext() if e.keyCode == 110
