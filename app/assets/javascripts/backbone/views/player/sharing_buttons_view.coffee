class @SharingButtonsView extends Backbone.View
  el: '.sharing-buttons'
  events:
    'click .facebook-sharing-button': 'openFacebookShareDialog'

  initialize: =>
    playerState.on 'change:currentTrack', @render

  render: =>
    @$el.html(JST['templates/sharing_buttons']())

  openFacebookShareDialog: =>
    width = 545
    height = 433
    leftPosition = (window.screen.width / 2) - ((width / 2) + 10)
    topPosition = (window.screen.height / 2) - ((height / 2) + 50)
    window.open(@url(), "Window2", "status=no,height=500,width=500,resizable=yes,left=" + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY=" + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no")

  url: =>
    baseUrl = "https://www.facebook.com/sharer/sharer.php?u="
    trackUrl = playerState.get('currentTrack').get('permalink_url')
    return baseUrl + encodeURIComponent(trackUrl)
