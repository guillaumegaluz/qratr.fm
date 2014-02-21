class @User extends Backbone.Model
  isLoggedIn: =>
    return @get('id')
