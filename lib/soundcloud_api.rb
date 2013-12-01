module SoundCloudAPI
  def self.client
    SoundCloud.new(:client_id => "7b0148ec311a1ffa34c7e0248ed2c9de")
  end

  # This returns a SoundCloud::HashResponseWrapper object
  def self.track_response(track_url)
    client.get('/resolve', :url => track_url)
  end

  def self.track_hash(track_url)
    track_response = track_response(track_url)
    
    {
      :artist => track_response.user.username,
      :title => track_response.title,
      :soundcloud_id => track_response.id,
      :permalink_url => track_response.permalink_url,
      :artwork_url => track_response.artwork_url || track_response.user.avatar_url,
      :stream_url => track_response.stream_url,
      :duration => track_response.duration
    }
  end
end
