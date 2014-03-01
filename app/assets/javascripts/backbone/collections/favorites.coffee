# class @Favorites extends Backbone.Collection
#   model: Track

#   initialize: =>
#     @on 'add', @saveFavorite
#     @on 'remove', @destroyFavorite

#   contains: (track) =>
#     !!@get(track.get('id'))

#   saveFavorite: (track) =>
#     data = {
#       favorite: {
#         user_id: window.user.get('id')
#         favorited_track_id : track.get('id')
#       }
#     }
#     $.ajax
#       type: 'post'
#       url: '/favorites'
#       dataType: 'json'
#       data: data
#       success: =>
#         @trigger('favorite_saved')

#   destroyFavorite: (track) =>
#     data = {
#       favorite: {
#         user_id: window.user.get('id')
#         favorited_track_id : track.get('id')
#       }
#     }
#     $.ajax
#       type: 'delete'
#       url: '/favorites'
#       dataType: 'json'
#       data: data
#       success: =>
#         @trigger('favorite_saved')

