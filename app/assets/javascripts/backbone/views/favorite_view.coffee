class @FavoriteView extends Backbone.View
  el: ".favorite-track"

  clickFavorite: =>
    mixpanel.track("Track Click Favorite");
    if window.user.isLoggedIn()
      @saveFavorite()
    else
      window.signupModalView.render()
      # @showPopover()

  showPopover: =>
    $popover = $('.favorite-track').popover(
      html: true
      content: JST['templates/favorite_tooltip']()
    )
    $popover.on 'shown.bs.popover', =>
      $('.favorite-tooltip .signup').on 'click', =>
        # TODO - Open signup modal
        console.log "Open signup modal"

  saveFavorite: =>
    data = {
      favorite: {
        user_id: window.user.get('id')
        favorited_track_id : window.player.currentTrack.get('id')
      }
    }
    $.ajax
      type: 'post'
      url: '/favorites'
      dataType: 'json'
      data: data
      success: =>
        @changeIconToFavorite()

  changeIconToFavorite: =>
    $('.icon-star').css('color', '#80c3c3')

  changeIconToUnfavorite: =>
    $('.icon-star').css('color', '#white')

  # shareFacebook: =>
    # FB.ui
    #   method: "feed"
    #   link: window.playlist.get('url')
    #   picture: window.player.currentTrack.get('artwork_url')
    #   name: "#{window.player.currentTrack.get('artist')} - #{window.player.currentTrack.get('title')}"
    #   caption: window.player.currentTrack.get('description')
    #   redirect_uri: "http://www.qratr.fm/"
    # , (response) ->
    #   # TODO - Implement success and error callbacks to notify user
