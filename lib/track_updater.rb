require 'soundcloud'
require 'soundcloud_api'

class TrackUpdater
  def self.update(track, properties)
    attributes = SoundCloudAPI.track_hash(track.permalink_url)
    properties.each do |property|
      track.update_attribute(property, attributes[property.to_sym])
    end
  end

  def self.update_all(properties)
    Track.all.each { |track| update(track, properties) }
  end
end
