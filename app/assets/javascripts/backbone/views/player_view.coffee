class @PlayerView extends Backbone.View
  el: ".player"
  events:
    'click .prev-track': 'clickPrevTrack'
    'click .play-pause': 'clickPlayPause'
    'click .next-track': 'clickNextTrack'
    'click .favorite-track': 'clickFavoriteTrack'
    'click .seek-bar': 'clickSeekBar'

  initialize: =>
    @bindKeyboardEvents()
    @render()

  render: =>
    @updateControls()
    @updateTrackView() # move somewhere else
    @favoriteView = new FavoriteView()

  clickPrevTrack: =>
    mixpanel.track("Track Click Prev");
    player.playPrev()

  clickPlayPause: =>
    mixpanel.track("Track Click PlayPause");
    player.trackClicked(window.player.currentTrack)

  clickNextTrack: =>
    mixpanel.track("Track Click Next");
    player.playNext()

  clickFavoriteTrack: =>
    @favoriteView.clickFavorite()

  clickSeekBar: (e) =>
    newRatio = e.clientX/window.innerWidth
    newPositionMs = newRatio * player.currentTrack.get('duration')
    player.currentSound.setPosition(newPositionMs)

    newElapsedPercentage = 100 - (newRatio * 100)
    newElapsedPercentageString = newElapsedPercentage.toString() + "%"
    $('.elapsed').css('right', newElapsedPercentageString)

  updateControls: =>
    $('.player').html(JST['templates/player'](track: window.player.currentTrack))
    $('.playback-button').css('visibility', 'visible')

  updateTrackView: =>
    @restAllTrackContainers()
    $trackContainer = $(".track-container[data-track-id=#{window.player.currentTrack.get('id')}]")
    $trackContainer.addClass('active')

  restAllTrackContainers: =>
    $(".track-container").each (i, trackContainerEl) =>
      $(trackContainerEl).removeClass('active')

  # Move method below to a PlayPauseIconView
  togglePlayPauseIcon: =>
    if $('.play-pause').hasClass("icon-play")
      $('.play-pause').removeClass("icon-play").addClass("icon-pause")
    else
      $('.play-pause').removeClass("icon-pause").addClass("icon-play")

  # Move method below to a PageTitleView
  togglePageTitle: =>
    if window.player.playing
      document.title = "▶ #{window.player.currentTrack.get('artist')} - #{window.player.currentTrack.get('title')}"
    else
      document.title = "Qratr.fm"

  # Move 2 methods below to a SeekBarView
  startSeekBarUpdate: =>
    if window.player.currentSound && window.player.playing
      @updateSeekBar()
    setTimeout(@startSeekBarUpdate, 50)

  updateSeekBar: (sound) =>
    elapsed_percentage = 100 - (window.player.currentSound.position / window.player.currentTrack.get('duration') * 100)
    elapsed_percentage_string = elapsed_percentage.toString() + "%"
    $('.elapsed').css('right', elapsed_percentage_string)

  bindKeyboardEvents: =>
    $(window).on 'keydown', (e) =>
      return  if e.target.nodeName == "INPUT"

      # TODO - Use events for instead of calling methods on global objects
      if e.keyCode == KeyCode.space
        e.preventDefault()
        player.trackClicked(window.player.currentTrack)
      
      player.playPrev() if e.keyCode == KeyCode.p
      player.playNext() if e.keyCode == KeyCode.n
      playlistsView.showNextPlaylist()  if e.keyCode == KeyCode.right_arrow
      playlistsView.showPrevPlaylist()  if e.keyCode == KeyCode.left_arrow
