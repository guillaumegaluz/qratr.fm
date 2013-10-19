class AddPlaylistIdInTracks < ActiveRecord::Migration
  def change
  	add_column :tracks, :playlist_id, :integer
  end
end
