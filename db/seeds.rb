class Seeds
  def self.generate_data
    Playlist.destroy_all
    Track.destroy_all
    self.generate_playlist
    self.generate_tracks
  end

  def self.generate_playlist
    @playlist = Playlist.create(:name => "A few songs to bring on a desert island")
  end

  def self.generate_tracks
    TrackCreator.new("https://soundcloud.com/terekke/pianodub").build
    TrackCreator.new("https://soundcloud.com/youngmarco/hnny-mys-young-marco-remix").build
    TrackCreator.new("https://soundcloud.com/wake-up-records/wake-up-001-rising-sun-b1?in=wake-up-records/sets/wake-up-001-rising-sun-awake").build
    TrackCreator.new("https://soundcloud.com/awesometapesfromafrica/shilela").build
    TrackCreator.new("https://soundcloud.com/ghostly/fort-romeau-jetee").build
    TrackCreator.new("https://soundcloud.com/analog-africa/florence-ayiero-orchestra").build
    TrackCreator.new("https://soundcloud.com/thrilljockey/future-islands-before-the").build

    Track.all.each { |t| t.update_attribute(:playlist_id, @playlist.id) }
  end
end
