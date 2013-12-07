class @PlayerView extends Backbone.View
  el: "#player"
  events:
    'click .prev-track': 'clickPrevTrack'
    'click .play-pause': 'clickPlayPause'
    'click .next-track': 'clickNextTrack'

  initialize: =>
    @bindKeyboardEvents()

  clickPrevTrack: =>
    player.playPrev()

  clickPlayPause: =>
    player.clickPlayPause()

  clickNextTrack: =>
    player.playNext()

  bindKeyboardEvents: =>
    $(window).on 'keypress', (e) ->
      e.preventDefault()
      player.clickPlayPause() if e.keyCode == 32
      player.playPrev() if e.keyCode == 112
      player.playNext() if e.keyCode == 110
