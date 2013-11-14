class @Player
	loadedSound: null
	loadedTrack: null
	playing: false

	trackClicked: (track) =>
		if @trackIsLoaded(track)
			if @playing then @pause() else @resume()
		else
			@play(track)

	loadTrack: (track) =>
		@loadedTrack = track
		@updateControls()
		@updateTrackView()

	trackIsLoaded: (track) =>
		track.get('soundcloud_id') == @loadedTrack.get('soundcloud_id')  if @loadedTrack

	play: (track) =>
		@loadedSound.stop()  if @loadedSound

		@loadTrack(track)
		SC.stream @loadedTrack.get('soundcloud_id'), (sound) =>
			sound.play()
			@loadedSound = sound
		@playing = true

	pause: =>
		@loadedSound.pause()
		@playing = false

	resume: =>
		@loadedSound.play()
		@playing = true

	updateControls: =>
		trackArtist = @loadedTrack.get('artist')
		trackTitle = @loadedTrack.get('title')
		$('.track-artist').html(trackArtist)
		$('.track-title').html(trackTitle)
		$('.soundcloud-logo').show(1000)
		$('.soundcloud-logo a').attr('href', @loadedTrack.get('permalink_url'))

	updateTrackView: =>
		@restAllTrackContainers()
		$trackContainer = $(".track-container[data-track-id=#{@loadedTrack.get('id')}]")
		$trackContainer.addClass('active')

	restAllTrackContainers: =>
		$(".track-container").each (i, trackContainerEl) =>
			$(trackContainerEl).removeClass('active')
