require 'soundcloud'
require 'rest-client'
require 'soundcloud_api'

class TrackCreator
  def self.build(track_url)
    attributes = SoundCloudAPI.track_hash(track_url)
    Track.where(:permalink_url => track_url).first_or_create(attributes)
  end
end
