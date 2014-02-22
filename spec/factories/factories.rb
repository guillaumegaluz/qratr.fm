FactoryGirl.define do
  factory :track, class: Track do
    title "Robert Wyatt"
    artist "Song For Che"
    permalink_url "permalink_url"
    stream_url "stream_url"
  end

  factory :other_track, class: Track do
    title "Opening"
    artist "Philip Glass"
    permalink_url "other_permalink_url"
    stream_url "other_stream_url"
  end

  factory :playlist, class: Playlist do
  end

  factory :user, class: User do
  end
end
