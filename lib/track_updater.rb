require 'soundcloud'
require 'soundcloud_api'

class TrackUpdater
  def self.update(track_id, properties)
    track_url = Track.find(track_id).permalink_url
    attributes = SoundCloudAPI.track_hash(track_url)

    Track.find(track_id).update_attribute('artwork_url', attributes[:artwork_url])  if properties.include?('artwork_url')
  end

  def self.update_all(properties)
    Track.all.each { |track| update(track.id, properties) }
  end
end
