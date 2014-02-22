class @PlayerView extends Backbone.View
  el: "#player"
  events:
    'click .prev-track': 'clickPrevTrack'
    'click .play-pause': 'clickPlayPause'
    'click .next-track': 'clickNextTrack'
    'click .favorite-track': 'clickFavoriteTrack'
    'click .seek-bar': 'clickSeekBar'

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

  clickFavoriteTrack: =>
    if !window.user.isLoggedIn()
      $popover = $('.favorite-track').popover(
        html: true
        content: JST['templates/favorite_tooltip']()
      )
      $popover.on 'shown.bs.popover', =>
        $('.favorite-tooltip .signup').on 'click', =>
          # TODO - Open signup modal
          console.log "Open signup modal"
    mixpanel.track("Track Click Favorite");
    data = {
      favorite: {
        user_id: window.user.get('id')
        favorited_track_id : window.player.currentTrack.get('id')
      }
    }
    $.ajax
      type: 'post'
      url: '/favorites'
      dataType: 'json'
      data: data

    # FB.ui
    #   method: "feed"
    #   link: window.playlist.get('url')
    #   picture: window.player.currentTrack.get('artwork_url')
    #   name: "#{window.player.currentTrack.get('artist')} - #{window.player.currentTrack.get('title')}"
    #   caption: window.player.currentTrack.get('description')
    #   redirect_uri: "http://www.qratr.fm/"
    # , (response) ->
    #   # TODO - Implement success and error callbacks to notify user

  clickSeekBar: (e) =>
    newRatio = e.clientX/window.innerWidth
    newPositionMs = newRatio * player.currentTrack.get('duration')
    player.currentSound.setPosition(newPositionMs)

    newElapsedPercentage = 100 - (newRatio * 100)
    newElapsedPercentageString = newElapsedPercentage.toString() + "%"
    $('.elapsed').css('right', newElapsedPercentageString)

  bindKeyboardEvents: =>
    $(window).on 'keydown', (e) =>
      return  if e.target.nodeName == "INPUT"

      # TODO - Extract keyCode into constants
      # TODO - Use events for instead of calling methods on global objects
      if e.keyCode == KeyCode.space
        e.preventDefault()
        player.clickPlayPause()

      player.playPrev() if e.keyCode == KeyCode.p
      player.playNext() if e.keyCode == KeyCode.n
      playlistsView.showNextPlaylist()  if e.keyCode == KeyCode.right_arrow
      playlistsView.showPrevPlaylist()  if e.keyCode == KeyCode.left_arrow
