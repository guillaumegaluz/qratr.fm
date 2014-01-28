class @Player
  currentTrack: null
  currentPlaylist: null
  currentSound: null
  playing: false

  trackClicked: (track) =>
    if @isCurrentTrack(track)
      if @playing then @pause() else @resume()
    else
      @play(track)

  loadTrack: (track) =>
    @currentTrack = track
    @currentPlaylist = window.playlist
    @updateControls()
    @updateTrackView()

  clickPlayPause: =>
    if @playing then @pause() else @resume()

  isCurrentTrack: (track) =>
    track.get('soundcloud_id') == @currentTrack.get('soundcloud_id')  if @currentTrack

  currentTrackIndex: =>
    @currentPlaylist.get('tracks').models.indexOf(@currentTrack)

  prevTrack: =>
    @currentPlaylist.get('tracks').models[@currentTrackIndex() - 1]

  nextTrack: =>
    @currentPlaylist.get('tracks').models[@currentTrackIndex() + 1]

  play: (track) =>
    @currentSound.stop()  if @currentSound

    @loadTrack(track)
    @incrementListenCount()
    @updatePageTitle()

    SC.stream @currentTrack.get('soundcloud_id'), (sound) =>
      console.log("[Now Playing] #{@currentTrack.get('artist')} - '#{@currentTrack.get('title')}'")
      sound.play(
        onfinish: => @play(@nextTrack())
      )
      @currentSound = sound
      @playing = true

  playPrev: =>
    @play(@prevTrack())  if @prevTrack()

  playNext: =>
    @play(@nextTrack())  if @nextTrack() 

  pause: =>
    @currentSound.pause()
    @playing = false
    $('.play-pause').css('background-position', "-442px")
    @resetPageTitle()

  resume: =>
    @currentSound.play()
    @playing = true
    $('.play-pause').css('background-position', "-483px")
    @updatePageTitle()

  incrementListenCount: =>
    newListenCount = @currentTrack.get('play_count') + 1
    # TODO - Save only the changed attributes
    @currentTrack.set('play_count', newListenCount).save({patch: true})

  updateControls: =>
    $('.playback-button').show(0)
    trackArtist = @currentTrack.get('artist')
    trackTitle = @currentTrack.get('title')
    trackArtwork = @currentTrack.get('artwork_url')
    $('.track-artwork').css('background-image', "url(#{trackArtwork})")
    $('.track-artist').html(trackArtist)
    $('.track-title').html(trackTitle)
    $('.soundcloud-logo').css({visibility: "visible"})
    $('.soundcloud-logo a').attr('href', @currentTrack.get('permalink_url'))

  updateTrackView: =>
    @restAllTrackContainers()
    $trackContainer = $(".track-container[data-track-id=#{@currentTrack.get('id')}]")
    $trackContainer.addClass('active')

  restAllTrackContainers: =>
    $(".track-container").each (i, trackContainerEl) =>
      $(trackContainerEl).removeClass('active')

  updatePageTitle: =>
    document.title = "▶ #{@currentTrack.get('artist')} - #{@currentTrack.get('title')}"

  resetPageTitle: =>
    document.title = "Qratr.fm"
