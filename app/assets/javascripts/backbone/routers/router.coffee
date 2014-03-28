class @Router extends Backbone.Router
  routes:
    'playlists/:playlistId/tracks/:trackId': 'autoPlay'

  autoPlay: (playlistId, trackId) =>
    playerState.autoPlay(trackId)
