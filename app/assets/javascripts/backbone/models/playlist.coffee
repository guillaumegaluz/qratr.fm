class @Playlist extends Backbone.Model
  initialize: =>
    tracks = new Tracks(@get('tracks') || [])
    @set('tracks', tracks)

  totalDuration: =>
    totalDuration = 0
    @get('tracks').each (track) ->
      totalDuration += track.get('duration')
    return new DurationInterpreter(totalDuration).toHourMin()
