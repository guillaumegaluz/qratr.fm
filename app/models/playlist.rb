class Playlist < ActiveRecord::Base
  has_many :tracks, -> { order(:position) }

  def url
    "/playlists/#{id}"
  end

  def as_json_with_tracks
    json_hash = self.as_json
    json_hash['tracks'] = self.tracks.map(&:as_json)
    json_hash
  end
end
