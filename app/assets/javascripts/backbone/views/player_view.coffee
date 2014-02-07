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
    mixpanel.track("Track Click Prev");
    player.playPrev()

  clickPlayPause: =>
    mixpanel.track("Track Click PlayPause");
    player.clickPlayPause()

  clickNextTrack: =>
    mixpanel.track("Track Click Next");
    player.playNext()

  clickShare: =>
    mixpanel.track("Track Click Share");
    FB.ui
      method: "feed"
      link: window.playlist.get('url')
      picture: window.player.currentTrack.get('artwork_url')
      name: "#{window.player.currentTrack.get('artist')} - #{window.player.currentTrack.get('title')}"
      caption: window.player.currentTrack.get('description')
      redirect_uri: "http://www.qratr.fm/"
    , (response) ->
      # TODO - Implement success and error callbacks to notify user

  bindKeyboardEvents: =>
    $(window).on 'keydown', (e) =>
      return  if e.target.nodeName == "INPUT"
      e.preventDefault()

      # TODO - Extract keyCode into constants
      # TODO - Use events for instead of calling methods on global objects
      player.clickPlayPause() if e.keyCode == 32
      player.playPrev() if e.keyCode == 80
      player.playNext() if e.keyCode == 78
      playlistsView.showNextPlaylist()  if e.keyCode == 39
      playlistsView.showPrevPlaylist()  if e.keyCode == 37
