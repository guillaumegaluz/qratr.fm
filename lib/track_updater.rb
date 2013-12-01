require 'soundcloud'
require 'soundcloud_api'

class TrackUpdater
  def self.update(track, properties)
    attributes = SoundCloudAPI.track_hash(track.permalink_url)

    track.update_attribute('artwork_url', attributes[:artwork_url])  if properties.include?('artwork_url')
  end

  def self.update_all(properties)
    Track.all.each { |track| update(track, properties) }
  end
end
