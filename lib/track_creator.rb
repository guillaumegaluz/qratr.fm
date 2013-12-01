require 'soundcloud'
require 'rest-client'
require 'soundcloud_api'

class TrackCreator
  def self.build(track_url)
    track_json = SoundCloudAPI.track_json(track_url)
    track_hash = JSON.parse(track_json)
    attributes = {
      :artist => track_hash['user']['username'],
      :title => track_hash['title'],
      :soundcloud_id => track_hash['id'],
      :permalink_url => track_hash['permalink_url'],
      :artwork_url => track_hash['artwork_url'] || track_hash["user"]["avatar_url"],
      :stream_url => track_hash['stream_url'],
      :duration => track_hash['duration']
    }
    Track.where(:permalink_url => track_hash['permalink_url']).first_or_create(attributes)
  end
end
