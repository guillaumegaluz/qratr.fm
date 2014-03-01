class @NavigationView extends Backbone.View
  el: '.navigation'
  events:
    'click .navigation-prev': 'setPreviousPlaylist'
    'click .navigation-next': 'setNextPlaylist'

  initialize: =>
    @render()
    playerState.on 'change:displayPlaylist', @render

  render: =>
    playlist = playerState.get('displayPlaylist')
    $('.navigation-prev').css('visibility', if playlist.get('has_prev_playlist') then 'visible' else 'hidden')
    $('.text-prev').html(playlist.get('prev_playlist_name'))
    $('.navigation-next').css('visibility', if playlist.get('has_next_playlist') then 'visible' else 'hidden')
    $('.text-next').html(playlist.get('next_playlist_name'))

  setPreviousPlaylist: =>
    mixpanel.track("Playlist Click Prev");
    playerState.setPreviousPlaylist()

  setNextPlaylist: =>
    mixpanel.track("Playlist Click Next");
    playerState.setNextPlaylist()
