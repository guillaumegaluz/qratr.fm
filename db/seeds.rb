class Seeds

  @playlist_1_urls = [
    "https://soundcloud.com/terekke/pianodub",
    "https://soundcloud.com/youngmarco/hnny-mys-young-marco-remix",
    "https://soundcloud.com/wake-up-records/wake-up-001-rising-sun-b1?in=wake-up-records/sets/wake-up-001-rising-sun-awake",
    "https://soundcloud.com/awesometapesfromafrica/shilela",
    "https://soundcloud.com/ghostly/fort-romeau-jetee",
    "https://soundcloud.com/analog-africa/florence-ayiero-orchestra",
    "https://soundcloud.com/thrilljockey/future-islands-before-the"
  ]

  @playlist_2_urls = [
    "https://soundcloud.com/colonelgatito/ivan-smagghes-bbc-6mix",
    "https://soundcloud.com/l-i-e-s/jahiliyya-fields-aeon-anon",
    "https://soundcloud.com/oldich-dress-drink/chris-kontos-kennedy-party",
    "https://soundcloud.com/dummymag/dummy-mix-186-fort-romeau",
    "https://soundcloud.com/coopersaver/farawaymix",
    "https://soundcloud.com/kim-brown/sets/somewhere-else-its-going-to-be",
    "https://soundcloud.com/hessleaudio/joe-slope"
  ]

  @playlist_3_urls = [
    "https://soundcloud.com/mexicansummer/why-are-you-crying?in=mexicansummer/sets/connan-mockasin-caramel",
    "https://soundcloud.com/platform/prins-thomas-b2b-gerd-janson",
    "https://soundcloud.com/justin-van-der-volgen/alexander-robotnick"
  ]

  def self.generate_data
    self.reset_database
    self.generate_playlist
    self.generate_tracks
    self.use_local_artwork
  end

  def self.reset_database
    Playlist.destroy_all
    Track.destroy_all
  end

  def self.generate_playlist
    @playlist_1 = Playlist.create(:name => "October '13")
    @playlist_2 = Playlist.create(:name => "November '13")
    @playlist_3 = Playlist.create(:name => "December '13")
  end

  def self.generate_tracks
    @playlist_1_urls.each do |track_url|
      @playlist_1.tracks << TrackCreator.new(track_url).build
    end

    @playlist_2_urls.each do |track_url|
      @playlist_2.tracks << TrackCreator.new(track_url).build
    end

    @playlist_3_urls.each do |track_url|
      @playlist_3.tracks << TrackCreator.new(track_url).build
    end
  end

  def use_local_artwork
    Track.all.each do |track|
      track.update_attribute(:artwork_url, "default_artwork.jpg")
    end
  end
end
