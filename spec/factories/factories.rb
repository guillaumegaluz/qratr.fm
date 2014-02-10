FactoryGirl.define do
  factory :track do
    title "Robert Wyatt"
    artist "Song For Che"
    permalink_url "permalink_url"
    stream_url "stream_url"
  end

  factory :other_track do
    title "Opening"
    artist "Philip Glass"
    permalink_url "other_permalink_url"
    stream_url "other_stream_url"
  end

  factory :playlist do
  end
end
