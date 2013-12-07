class @PlayerView extends Backbone.View
  el: "#player"
  events:
    'click .prev-track': 'clickPrevTrack'
    'click .play-pause': 'clickPlayPause'
    'click .next-track': 'clickNextTrack'
    'click .share': 'clickShare'

  initialize: =>
    @bindKeyboardEvents()

  clickPrevTrack: =>
    player.playPrev()

  clickPlayPause: =>
    player.clickPlayPause()

  clickNextTrack: =>
    player.playNext()

  clickShare: =>
    FB.ui
      method: "feed"
      link: window.playlist.get('url')
      picture: window.playlist.get('tracks').models[0].get('artwork_url')
      name: "#{window.player.currentTrack.get('artist')} #{window.player.currentTrack.get('title')}"
      caption: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      redirect_uri: "http://v2.qratr.net"
    , (response) ->

  bindKeyboardEvents: =>
    $(window).on 'keypress', (e) ->
      e.preventDefault()
      player.clickPlayPause() if e.keyCode == 32
      player.playPrev() if e.keyCode == 112
      player.playNext() if e.keyCode == 110
