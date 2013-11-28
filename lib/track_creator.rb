require 'soundcloud'
require 'rest-client'

class TrackCreator
  def initialize(track_url)
    @track_url = track_url
  end

  def build
    track_hash = JSON.parse(track_json)
    attributes = {
      :artist => track_hash['user']['username'],
      :title => track_hash['title'],
      :soundcloud_id => track_hash['id'],
      :permalink_url => track_hash['permalink_url'],
      :artwork_url => track_hash['artwork_url'],
      :stream_url => track_hash['stream_url'],
      :duration => track_hash['duration']
    }
    Track.create!(attributes)
  end

  def track_json
    RestClient.get(resolve_url)
  end

  def resolve_url
    resolve_url = 'http://api.soundcloud.com/resolve.json'
    resolve_url += '?url=' + @track_url
    resolve_url += '&client_id=' + '7b0148ec311a1ffa34c7e0248ed2c9de'
    return resolve_url
  end
end
