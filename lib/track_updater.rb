require 'soundcloud'
require 'soundcloud_api'

class TrackUpdater
  def self.update(track_id, attributes)
    track_url = Track.find(track_id).permalink_url
    attributes = SoundCloudAPI.track_hash(track_url)

    track.update_attribute('artwork_url', track_hash['artwork_url'] || track_hash["user"]["avatar_url"])  if attributes.include?('artwork_url')
  end

  def self.update_all(attributes)
    Track.all.each { |track| update(track.id, attributes) }
  end
end
