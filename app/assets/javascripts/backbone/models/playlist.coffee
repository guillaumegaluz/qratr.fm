class @Playlist extends Backbone.Model
  initialize: =>
    @tracks = new Tracks(@get('tracks') || [])
