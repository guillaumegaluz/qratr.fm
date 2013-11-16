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
    @updateBrowserAddressBar()

  renderPlaylist: =>
    playlistHtml = JST['templates/playlist'](playlist: playlist)
    $('.playlist-container').html(playlistHtml)
    new PlaylistView(model: playlist)
    @displayNavigation()

  updateBrowserAddressBar: =>
    history.pushState(null, null, playlist.get('url'))

  displayNavigation: =>
    if playlist.get('has_prev_playlist')
      $('.prev').show()
    else
      $('.prev').hide()

    if playlist.get('has_next_playlist')
      $('.next').show()
    else
      $('.next').hide()
