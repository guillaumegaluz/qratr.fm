class AddIndexToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, [:user_id, :favorited_track_id], :unique => true
  end
end
