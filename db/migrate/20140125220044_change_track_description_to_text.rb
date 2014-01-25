class ChangeTrackDescriptionToText < ActiveRecord::Migration
  def change
    change_column :tracks, :description, :text
  end
end
