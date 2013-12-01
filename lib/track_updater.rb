class TrackUpdater
  def self.update(track_id, attributes)
    track = Track.find(track_id)
    permalink_url = track.permalink_url
    resolve_url = resolve_url(permalink_url)
    track_json = RestClient.get(resolve_url)
    track_hash = JSON.parse(track_json)

    track.update_attribute('artwork_url', track_hash['artwork_url'] || track_hash["user"]["avatar_url"])  if attributes.include?('artwork_url')
  end

  def self.update_all(attributes)
    Track.all.each do |track|
      update(track.id, attributes)
    end
  end

  def self.resolve_url(permalink_url)
    resolve_url = 'http://api.soundcloud.com/resolve.json'
    resolve_url += '?url=' + permalink_url
    resolve_url += '&client_id=' + '7b0148ec311a1ffa34c7e0248ed2c9de'
    return resolve_url
  end
end
