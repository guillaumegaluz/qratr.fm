class AddWaveformAndPurchaseUrlToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :waveform_url, :string
    add_column :tracks, :purchase_url, :string
    add_column :tracks, :description, :string
  end
end
