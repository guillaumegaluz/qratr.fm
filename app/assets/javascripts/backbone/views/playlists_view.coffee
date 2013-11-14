class @PlaylistsView extends Backbone.View
  el: 'body'
  events:
    'click .prev': 'showPrevPlaylist'
    'click .next': 'showNextPlaylist'

  currentPlaylistId: =>
    playlist.id

  showPrevPlaylist: =>
    console.log "showPrevPlaylist"
    $.ajax
      url: "/playlists/#{@currentPlaylistId() - 1}"
      type: 'get'
      dataType: 'json'
      success: @replaceHtml

  showNextPlaylist: =>
    console.log "showNextPlaylist"
    $.ajax
      url: "/playlists/#{@currentPlaylistId() + 1}"
      type: 'get'
      dataType: 'json'
      success: @replaceHtml
        
  replaceHtml: (data) =>
    window.playlist = new Playlist(data)
    @render()

  render: =>
    playlistHtml = JST['templates/playlist'](playlist: playlist)
    $('.playlist-container').html(playlistHtml)
    new PlaylistView(model: playlist)
