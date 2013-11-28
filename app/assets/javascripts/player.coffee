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

  isCurrentTrack: (track) =>
    track.get('soundcloud_id') == @currentTrack.get('soundcloud_id')  if @currentTrack

  currentTrackIndex: =>
    @currentPlaylist.get('tracks').models.indexOf(@currentTrack)

  prevTrack: =>
    @currentPlaylist.get('tracks').models[@currentTrackIndex() + 1]

  nextTrack: =>
    @currentPlaylist.get('tracks').models[@currentTrackIndex() + 1]

  play: (track) =>
    @currentSound.stop()  if @currentSound

    @loadTrack(track)
    SC.stream @currentTrack.get('soundcloud_id'), (sound) =>
      console.log("[Now Playing] #{@currentTrack.get('artist')} - '#{@currentTrack.get('title')}'")
      sound.play(
        onfinish: => @play(@nextTrack())
      )
      @currentSound = sound
      @playing = true

  pause: =>
    @currentSound.pause()
    @playing = false

  resume: =>
    @currentSound.play()
    @playing = true

  updateControls: =>
    trackArtist = @currentTrack.get('artist')
    trackTitle = @currentTrack.get('title')
    $('.track-artist').html(trackArtist)
    $('.track-title').html(trackTitle)
    $('.soundcloud-logo').show(1000)
    $('.soundcloud-logo a').attr('href', @currentTrack.get('permalink_url'))

  updateTrackView: =>
    @restAllTrackContainers()
    $trackContainer = $(".track-container[data-track-id=#{@currentTrack.get('id')}]")
    $trackContainer.addClass('active')

  restAllTrackContainers: =>
    $(".track-container").each (i, trackContainerEl) =>
      $(trackContainerEl).removeClass('active')
