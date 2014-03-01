# class @FavoriteView extends Backbone.View
#   el: ".favorite-button"
#   events:
#     'click': 'clickFavorite'

#   initialize: =>
#     playerState.on('change:currentTrack', @render)
#     window.user.favorites.on 'favorite_saved', @toggleIconColor
#     @$icon = $('.icon-star')
#     @render()

#   render: =>
#     @$icon.addClass('favorite')  if @isCurrentTrackAFavorite()

#   isCurrentTrackAFavorite: =>
#     window.user.favorites.contains(playerState.get('currentTrack'))

#   clickFavorite: =>
#     mixpanel.track("Track Click Favorite");
#     if window.user.isLoggedIn()
#       if @isCurrentTrackAFavorite() then @destroyFavorite() else @saveFavorite()
#     else
#       window.signupModalView.render()
#       # @showPopover()

#   saveFavorite: =>
#     window.user.favorites.add(window.player.currentTrack)

#   destroyFavorite: =>
#     window.user.favorites.remove(window.player.currentTrack)

#   toggleIconColor: =>
#     if @$icon.hasClass('favorite') then @$icon.removeClass('favorite') else @$icon.addClass('favorite')

#   # showPopover: =>
#   #   $popover = $('.favorite-track').popover(
#   #     html: true
#   #     content: JST['templates/favorite_tooltip']()
#   #   )
#   #   $popover.on 'shown.bs.popover', =>
#   #     $('.favorite-tooltip .signup').on 'click', =>
#   #       # TODO - Open signup modal
#   #       console.log "Open signup modal"

#   # shareFacebook: =>
#     # FB.ui
#     #   method: "feed"
#     #   link: window.playlist.get('url')
#     #   picture: window.player.currentTrack.get('artwork_url')
#     #   name: "#{window.player.currentTrack.get('artist')} - #{window.player.currentTrack.get('title')}"
#     #   caption: window.player.currentTrack.get('description')
#     #   redirect_uri: "http://www.qratr.fm/"
#     # , (response) ->
#     #   # TODO - Implement success and error callbacks to notify user
