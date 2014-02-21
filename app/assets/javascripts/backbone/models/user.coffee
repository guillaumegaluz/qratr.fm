class @User extends Backbone.Model
  isLoggedIn: =>
    !!@get('id')
