class @PlayerState extends Backbone.Model
  defaults:
    currentTrack: null
    currentPlaylist: null
    displayPlaylist: null
    currentSound: null
    paused: false

  togglePlaybackState: =>
    @set('paused', !@get('paused'))

  setNextTrack: =>
    return if @isLastTrack()
    @set 'currentTrack', @nextTrack()

  setPreviousTrack: =>
    return if @isFirstTrack()
    @set 'currentTrack', @previousTrack()

  indexOfCurrentTrack: =>
    @get('currentPlaylist').get('tracks').models.indexOf(@get('currentTrack'))

  previousTrack: =>
    @get('currentPlaylist').get('tracks').models[@indexOfCurrentTrack() - 1]

  nextTrack: =>
    @get('currentPlaylist').get('tracks').models[@indexOfCurrentTrack() + 1]

  isFirstTrack: =>
    @indexOfCurrentTrack() == 0

  isLastTrack: =>
    @indexOfCurrentTrack() == @get('currentPlaylist').get('tracks').length - 1

  currentPlaylistId: =>
    @get('displayPlaylist').id

  setPreviousPlaylist: =>
    @setPlaylist(@currentPlaylistId() - 1)

  setNextPlaylist: =>
    @setPlaylist(@currentPlaylistId() + 1)

  setPlaylist: (playlistId) =>
    $.ajax
      url: "/playlists/#{playlistId}"
      type: 'get'
      dataType: 'json'
      success: (data) => 
        playerState.set 'displayPlaylist', new Playlist(data)

  autoPlay: (trackId) =>
    track = @get('displayPlaylist').get('tracks').get(trackId)
    playerState.set('currentPlaylist', @get('displayPlaylist'))
    playerState.set('currentTrack', track)
