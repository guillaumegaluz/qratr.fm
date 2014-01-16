class @CreatePlaylistView extends Backbone.View
  el: 'body'
  events:
    'change input': 'fetchTrack'

  fetchTrack: =>
    unless @inputValueIsValidateUrl()
      @updateFetchStatus("Are you sure this is a valid link?")
      return

    @updateFetchStatus("Contacting Soundcloud")
    $.ajax
      url: @resolveUrl($('input').val())
      type: "get"
      success: (json) =>
        @appendTrackData(json)
      error: =>
        @updateFetchStatus("Zut! Something went wrong. Would you mind trying again?")

  inputValueIsValidateUrl: (url) =>
    # Improve validation regex
    if $('input').val().match(/soundcloud/)
      return true

  resolveUrl: (url) =>
    baseResolveUrl = 'http://api.soundcloud.com/resolve.json'
    permalinkParam = '?url=' + url
    clientIdParam = '&client_id=' + '7b0148ec311a1ffa34c7e0248ed2c9de'
    return baseResolveUrl + permalinkParam + clientIdParam

  appendTrackData: (json) =>
    @updateFetchStatus("Retrieving Track Info")
    track = new Track(json)
    console.log track
    trackHtml = JST['templates/track'](track: track)
    console.log trackHtml
    $('.playlist-container').append(trackHtml)
    setTimeout( =>
      @updateFetchStatus("")
    , 1000)
    $('input').val("")

  updateFetchStatus: (message) =>
    $('.fetch-status').html(message)
