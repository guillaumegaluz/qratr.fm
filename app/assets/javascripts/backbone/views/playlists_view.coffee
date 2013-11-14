class @PlaylistsView extends Backbone.View
  el: 'body'
  events:
    'click .prev': 'showPrevPlaylist'
    'click .next': 'showNextPlaylist'

  currentPlaylistId: =>
    playlist.id

  previousPlaylistId: =>
    @currentPlaylistId() - 1

  nextPlaylistId: =>
    @currentPlaylistId() + 1

  showPrevPlaylist: =>
    @getPlaylist(@previousPlaylistId())

  showNextPlaylist: =>
    @getPlaylist(@nextPlaylistId())

  getPlaylist: (playlistId) =>
    $.ajax
      url: "/playlists/#{playlistId}"
      type: 'get'
      dataType: 'json'
      success: @updatePlaylist
        
  updatePlaylist: (data) =>
    window.playlist = new Playlist(data)
    @renderPlaylist()

  renderPlaylist: =>
    playlistHtml = JST['templates/playlist'](playlist: playlist)
    $('.playlist-container').html(playlistHtml)
    new PlaylistView(model: playlist)
