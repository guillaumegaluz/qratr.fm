class @KeyboardView extends Backbone.View
  initialize: =>
    @bindKeyboardEvents()

  bindKeyboardEvents: =>
    $(window).on 'keydown', (e) =>
      return  if e.target.nodeName == "INPUT"

      if e.keyCode == KeyCode.space
        e.preventDefault()
        playerState.togglePlaybackState()
      
      playerState.setPreviousPlaylist()  if e.keyCode == KeyCode.left
      playerState.setNextPlaylist()  if e.keyCode == KeyCode.right
      
      if e.keyCode == KeyCode.down
        e.preventDefault()  if playerState.get('currentPlaylist').id != playerState.get('displayPlaylist').id
        playerState.setNextTrack()

      if e.keyCode == KeyCode.up
        e.preventDefault()  if playerState.get('currentPlaylist').id != playerState.get('displayPlaylist').id
        playerState.setPreviousTrack()
