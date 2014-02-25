class @Player
  currentTrack: null
  currentPlaylist: null
  currentSound: null
  playing: false

  trackClicked: (track) =>
    if @isCurrentTrack(track) && !!@currentSound
      if @playing then @pause() else @resume()
    else
      @loadTrack(track)
      @play()

  loadTrack: (track) =>
    @currentTrack = track
    @currentPlaylist = window.playlist
    window.playerView.render()

  isCurrentTrack: (track) =>
    track.get('soundcloud_id') == @currentTrack.get('soundcloud_id')  if @currentTrack

  currentTrackIndex: =>
    @currentPlaylist.get('tracks').models.indexOf(@currentTrack)

  prevTrack: =>
    @currentPlaylist.get('tracks').models[@currentTrackIndex() - 1]

  nextTrack: =>
    @currentPlaylist.get('tracks').models[@currentTrackIndex() + 1]

  play: =>
    @playing = true
    @currentSound.stop()  if @currentSound

    @incrementListenCount()
    window.playerView.togglePageTitle()
    window.playerView.togglePlayPauseIcon()

    SC.stream @currentTrack.get('soundcloud_id'), (sound) =>
      console.log("[Now Playing] #{@currentTrack.get('artist')} - '#{@currentTrack.get('title')}'")
      sound.play(
        onfinish: =>
          @play(@nextTrack())
          mixpanel.track("Track Auto Next");
      )
      @currentSound = sound
      window.playerView.startSeekBarUpdate()

  playPrev: =>
    if @prevTrack()
      @loadTrack(@prevTrack())
      @play()

  playNext: =>
    if @nextTrack()
      @loadTrack(@nextTrack() )
      @play()

  pause: =>
    @currentSound.pause()
    @playing = false
    window.playerView.togglePlayPauseIcon()
    window.playerView.togglePageTitle()

  resume: =>
    @currentSound.play()
    @playing = true
    window.playerView.togglePlayPauseIcon()
    window.playerView.togglePageTitle()

  incrementListenCount: =>
    newListenCount = @currentTrack.get('play_count') + 1
    # TODO - Save only the changed attributes
    @currentTrack.set('play_count', newListenCount).save({patch: true})
