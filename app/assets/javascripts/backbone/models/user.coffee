class @User extends Backbone.Model
  initialize: =>
    @favorites = new Favorites(@get('favorites'))

  isLoggedIn: =>
    !!@get('id')
