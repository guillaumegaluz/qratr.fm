class CreateTableFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :favorited_track_id

      t.timestamps
    end
  end
end
