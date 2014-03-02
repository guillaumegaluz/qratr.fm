class Playlist < ActiveRecord::Base
  has_many :tracks, -> { order(:duration) }

  def url
    ApplicationHelper::Url::root_domain + "/playlists/#{id}"
  end

  def prev_playlist_name
    Playlist.find(id - 1).name  if has_prev_playlist
  end

  def next_playlist_name
    Playlist.find(id + 1).name  if has_next_playlist
  end

  def has_prev_playlist
    id != Playlist.first.id
  end

  def has_next_playlist
    id != Playlist.last.id
  end

  # TODO - Test this method
  def as_json_with_tracks
    additional_data = {
      'url' => url,
      'prev_playlist_name' => prev_playlist_name,
      'next_playlist_name' => next_playlist_name,
      'has_prev_playlist' => has_prev_playlist,
      'has_next_playlist' => has_next_playlist,
      'tracks' => tracks.map(&:as_json_custom)
    }
    puts additional_data
    self.as_json.merge(additional_data)
  end
end
