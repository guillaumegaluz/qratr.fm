class AddListenCountToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :listen_count, :integer
  end
end
