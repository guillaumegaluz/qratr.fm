class Playlist < ActiveRecord::Base
  has_many :tracks, -> { order(:position) }

  def url
    ApplicationHelper::Url::root_domain + "/playlists/#{id}"
  end

  def has_prev_playlist
    id != Playlist.first.id
  end

  def has_next_playlist
    id != Playlist.last.id
  end

  def as_json_with_tracks
    additional_data = {
      url: url,
      has_prev_playlist: has_prev_playlist,
      has_next_playlist: has_next_playlist,
      tracks: tracks.map(&:as_json)
    }
    self.as_json.merge(additional_data)
  end
end
