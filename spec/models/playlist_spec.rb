require 'spec_helper'

describe Playlist do
  before(:each) do
    @playlist1 = FactoryGirl.create(:playlist, id: 1, name: "playlist1")
    @playlist2 = FactoryGirl.create(:playlist, id: 2, name: "playlist2")
    @playlist3 = FactoryGirl.create(:playlist, id: 3, name: "playlist3")
  end

  describe "#url" do
    it "returns the playlist's url" do
      expect(@playlist1.url).to eq("http://localhost:5000/playlists/1")
    end
  end

  describe "#has_prev_playlist" do
    it "returns the right boolean" do
      expect(@playlist1.has_prev_playlist).to eq(false)
      expect(@playlist2.has_prev_playlist).to eq(true)
      expect(@playlist3.has_prev_playlist).to eq(true)
    end
  end

  describe "#has_next_playlist" do
    it "returns the right boolean" do
      expect(@playlist1.has_next_playlist).to eq(true)
      expect(@playlist2.has_next_playlist).to eq(true)
      expect(@playlist3.has_next_playlist).to eq(false)
    end
  end

  describe "#prev_playlist_name" do
    it "returns the name of the previous playlist" do
      expect(@playlist1.prev_playlist_name).to be_nil
      expect(@playlist2.prev_playlist_name).to eq("playlist1")
      expect(@playlist3.prev_playlist_name).to eq("playlist2")
    end
  end

  describe "#next_playlist_name" do
    it "returns the name of the next playlist" do
      expect(@playlist1.next_playlist_name).to eq("playlist2")
      expect(@playlist2.next_playlist_name).to eq("playlist3")
      expect(@playlist3.next_playlist_name).to be_nil
    end
  end

  describe "#as_json_with_tracks" do
    it "returns a hash with the playlist attributes" do
      FactoryGirl.create(:track, playlist: @playlist1, duration: 400_000)
      FactoryGirl.create(:other_track, playlist: @playlist1, duration: 100_000)

      hash = @playlist1.as_json_with_tracks

      expect(hash["id"]).to eq(1)
      expect(hash["name"]).to eq("playlist1")
      expect(hash["url"]).to eq("http://localhost:5000/playlists/1")
      expect(hash["prev_playlist_name"]).to eq(nil)
      expect(hash["next_playlist_name"]).to eq("playlist2")
      expect(hash["has_prev_playlist"]).to eq(false)
      expect(hash["has_next_playlist"]).to eq(true)
      expect(hash["total_duration"]).to eq(500_000)
      expect(hash["tracks"].count).to eq(2)
    end 
  end
end
