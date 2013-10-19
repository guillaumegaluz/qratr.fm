module ApplicationHelper

  def prev_playlist(playlist_id)
    begin
      prev_playlist = Playlist.find(playlist_id - 1)
    rescue
      nil
    else
      prev_playlist.url
    end
  end

  def next_playlist(playlist_id)
    begin
      next_playlist = Playlist.find(playlist_id + 1)
    rescue
      nil
    else
      next_playlist.url
    end
  end
end
