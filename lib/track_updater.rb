require 'track_creator'

class TrackUpdater
  def self.update(id, url)
    track = Track.find(id)
    track_hash = JSON.parse(TrackCreator.new(url).track_json)

    attributes = {
      :artist => track_hash['user']['username'],
      :title => track_hash['title'],
      :soundcloud_id => track_hash['id'],
      :permalink_url => track_hash['permalink_url'],
      :artwork_url => track_hash['artwork_url'],
      :stream_url => track_hash['stream_url']
    }
    track.update_attributes!(attributes)
  end
end
