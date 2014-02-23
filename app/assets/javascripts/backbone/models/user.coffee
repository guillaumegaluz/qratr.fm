class @User extends Backbone.Model
  initialize: =>
    @get('favorites').forEach (i, favorite) =>
      new Favorite(favorite)

  isLoggedIn: =>
    !!@get('id')
