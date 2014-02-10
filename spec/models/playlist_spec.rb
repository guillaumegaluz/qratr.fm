require 'spec_helper'
require './app/models/playlist'

describe Playlist, :focus => true do
  let(:playlist1) { FactoryGirl.create(:playlist, id: 1, name: "playlist1")}
  let(:playlist2) { FactoryGirl.create(:playlist, id: 2, name: "playlist2")}
  let(:playlist3) { FactoryGirl.create(:playlist, id: 3, name: "playlist3")}

  # describe "#url" do
  #   it "returns the playlist's url" do
  #     expect(playlist1.url).to eq("http://localhost:5000/playlists/1")
  #   end
  # end

  # describe "#has_prev_playlist" do
  #   it "returns the right boolean" do
  #     expect(playlist1.has_prev_playlist).to eq(false)
  #     expect(playlist2.has_prev_playlist).to eq(true)
  #     expect(playlist3.has_prev_playlist).to eq(true)
  #   end
  # end

  describe "#has_next_playlist" do
    it "returns the right boolean" do
      p Playlist.last
      p Playlist.first
      expect(playlist1.has_next_playlist).to eq(true)
      expect(playlist2.has_next_playlist).to eq(true)
      expect(playlist3.has_next_playlist).to eq(false)
    end
  end

  # describe "#prev_playlist_name" do
  #   it "returns the name of the previous playlist" do
  #     expect(playlist1.prev_playlist_name).to be_nil
  #     expect(playlist2.prev_playlist_name).to eq("playlist1")
  #     expect(playlist3.prev_playlist_name).to eq("playlist2")
  #   end
  # end

  # describe "#next_playlist_name" do
  #   it "returns the name of the next playlist" do
  #     puts playlist1.next_playlist_name
  #     puts playlist2.next_playlist_name
  #     puts playlist3.next_playlist_name
  #     # expect(playlist1.next_playlist_name).to eq("playlist2")
  #     # expect(playlist2.next_playlist_name).to eq("playlist3")
  #     # expect(playlist3.next_playlist_name).to be_nil
  #   end
  # end
end
