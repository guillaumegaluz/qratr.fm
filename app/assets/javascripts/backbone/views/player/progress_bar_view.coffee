class @ProgressBarView extends Backbone.View
  el: '.progress-bar'
  events:
    'click': 'clickProgressBar'

  initialize: =>
    playerState.on 'change:currentTrack', @startProgressBar

  startProgressBar: =>
    @$el.css('visibility', 'visible')
    if playerState.get('currentSound') && !playerState.get('paused')
      ratio = playerState.get('currentSound').position / playerState.get('currentTrack').get('duration')
      @updateProgressBar(ratio)
    setTimeout(@startProgressBar, 50)

  clickProgressBar: (e) =>
    leftOffset = @$el.offset().left
    newRatio = (e.clientX - leftOffset)/@$el.width()
    playerState.get('currentSound').setPosition(newRatio * playerState.get('currentTrack').get('duration'))
    @updateProgressBar(newRatio)

  updateProgressBar: (ratio) =>
    newElapsedPercentage = 100 - (ratio * 100)
    newElapsedPercentageString = newElapsedPercentage.toString() + "%"
    $('.elapsed').css('right', newElapsedPercentageString)
