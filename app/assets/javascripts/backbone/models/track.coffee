class @Track extends Backbone.Model
  url: =>
    "/tracks/#{@get('id')}"
