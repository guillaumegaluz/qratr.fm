module ApplicationHelper

  # Prev and Next playlists URL
  def prev_playlist_url(playlist_id)
    begin
      prev_playlist = Playlist.find(playlist_id - 1)
    rescue
      nil
    else
      prev_playlist.url
    end
  end

  def next_playlist_url(playlist_id)
    begin
      next_playlist = Playlist.find(playlist_id + 1)
    rescue
      nil
    else
      next_playlist.url
    end
  end

  # Prev and Next playlists names
  def prev_playlist_name(playlist_id)
    begin
      prev_playlist = Playlist.find(playlist_id - 1)
    rescue
      nil
    else
      prev_playlist.name
    end
  end

  def next_playlist_name(playlist_id)
    begin
      next_playlist = Playlist.find(playlist_id + 1)
    rescue
      nil
    else
      next_playlist.name
    end
  end
end
