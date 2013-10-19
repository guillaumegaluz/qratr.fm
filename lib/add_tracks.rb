# Track.all.map{ |t| print t.id, "\t", t.title, "\n" }

urls = [
  "https://soundcloud.com/pdis_inpartmaint/john-wizards-tek-lek-schrempf",
  "https://soundcloud.com/femminielli/me-gusta-el-dolor-excerpt",
  "https://soundcloud.com/esp-institute/a-drogato",
  "https://soundcloud.com/colonelgatito/ivan-smagghes-bbc-6mix",
  "https://soundcloud.com/l-i-e-s/jahiliyya-fields-aeon-anon",
  "https://soundcloud.com/oldich-dress-drink/chris-kontos-kennedy-party",
  "https://soundcloud.com/aniara-recordings/a-from-you-have-i-been-absent",
  "https://soundcloud.com/dummymag/dummy-mix-186-fort-romeau",
  "https://soundcloud.com/beat-x-changers/beat-x-changers-podcast-003",
  "https://soundcloud.com/kouta/quiet-heart"
]

playlist = Playlist.create(:name => "October 2013")

urls.each do |url|
  track = TrackCreator.new(url).build
  track.playlist_id = playlist.id
end
