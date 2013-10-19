class CreateTableTracks < ActiveRecord::Migration
  def change
  	create_table :tracks do |t|
      t.string  :artist
      t.string  :title
      t.string  :permalink_url
      t.string  :artwork_url

      t.timestamps
    end
  end
end
