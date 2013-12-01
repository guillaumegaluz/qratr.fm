module SoundCloudAPI
  def self.track_json(permalink_url)
    RestClient.get(SoundcloudAPI.resolve_url(permalink_url))
  end

  def self.resolve_url(permalink_url)
    resolve_url = 'http://api.soundcloud.com/resolve.json'
    resolve_url += '?url=' + permalink_url
    resolve_url += '&client_id=' + '7b0148ec311a1ffa34c7e0248ed2c9de'
    return resolve_url
  end
end
