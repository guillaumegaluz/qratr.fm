class ChangeNameOfListenCountForTracks < ActiveRecord::Migration
  def change
    rename_column :tracks, :listen_count, :play_count
  end
end
