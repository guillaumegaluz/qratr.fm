class @PlaylistsView extends Backbone.View
  el: 'body'
  events:
    'click .prev': 'showPrevPlaylist'
    'click .next': 'showNextPlaylist'

  renderPlaylist: =>
    playlistHtml = JST['templates/playlist'](playlist: playlist)
    $('.playlist-container').html(playlistHtml)
    new PlaylistView(model: playlist)
    @displayNavigation()

  getPlaylist: (playlistId) =>
    $.ajax
      url: "/playlists/#{playlistId}"
      type: 'get'
      dataType: 'json'
      success: @updatePlaylist
        
  updatePlaylist: (data) =>
    window.playlist = new Playlist(data)
    @renderPlaylist()

  displayNavigation: =>
    $('.prev').css('visibility', if playlist.get('has_prev_playlist') then 'visible' else 'hidden')
    $('.next').css('visibility', if playlist.get('has_next_playlist') then 'visible' else 'hidden')

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
