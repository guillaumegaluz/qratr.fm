class @PageTitleView extends Backbone.View
  initialize: =>
    playerState.on 'change:paused', @togglePageTitle
    playerState.on 'change:currentTrack', @updateFacebookOGTags
    playerState.on 'change:currentTrack', @togglePageTitle

  togglePageTitle: =>
    if playerState.get('paused')
      document.title = "Qratr.fm"
    else
      document.title = "▶ #{playerState.get('currentTrack').get('artist')} - #{playerState.get('currentTrack').get('title')}"

  updateFacebookOGTags: =>
    track = playerState.get('currentTrack')
    $("meta[property='og:image']").attr('content', track.get('artwork_url'))
    $("meta[property='og:title']").attr('content', @titleString(track))
    $("meta[property='og:url']").attr('content', @urlString(track))

  titleString: (track) =>
    track.get('artist') + ' - ' + track.get('title')

  urlString: (track) =>
    playlist = playerState.get('currentPlaylist')
    baseUrl = "http://qratr.fm/"
    return baseUrl + "playlists/" + playlist.get('id') + "tracks/" + track.get('id')
