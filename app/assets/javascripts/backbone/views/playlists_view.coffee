class @PlaylistsView extends Backbone.View
  el: 'body'
  events:
    'click .navigation-prev': 'showPrevPlaylist'
    'click .navigation-next': 'showNextPlaylist'

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
    $('.navigation-prev').css('visibility', if playlist.get('has_prev_playlist') then 'visible' else 'hidden')
    $('.text-prev').html(playlist.get('prev_playlist_name'))
    $('.navigation-next').css('visibility', if playlist.get('has_next_playlist') then 'visible' else 'hidden')
    $('.text-next').html(playlist.get('next_playlist_name'))

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
