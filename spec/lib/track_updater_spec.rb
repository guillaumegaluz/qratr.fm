require 'spec_helper'
require './lib/track_updater'

describe TrackUpdater do
  before(:each) do
    new_attributes = {
      title: "New Title",
      artist: "New Artist",
      permalink_url: "new_permalink_url",
      stream_url: "new_stream_url"
    }
    SoundCloudAPI.stub(:track_hash) { new_attributes }
  end

  describe ".update" do
    let(:track) { FactoryGirl.create(:track) }

    it "updates only the properties passed as an argument" do
      properties = ["title", "artist"]
      TrackUpdater.update(track, properties)

      expect(track.reload.title).to eq("New Title")
      expect(track.reload.artist).to eq("New Artist")
      expect(track.reload.permalink_url).to eq("permalink_url")
      expect(track.reload.stream_url).to eq("stream_url")
    end
  end

  describe ".update_all" do    
    it "updates only the properties passed as an argument" do
      track1 = FactoryGirl.create(:track)
      track2 = FactoryGirl.create(:other_track)

      properties = ["title", "artist"]
      TrackUpdater.update_all(properties)

      expect(track1.reload.title).to eq("New Title")
      expect(track1.reload.artist).to eq("New Artist")
      expect(track1.reload.permalink_url).to eq("permalink_url")
      expect(track1.reload.stream_url).to eq("stream_url")

      expect(track2.reload.title).to eq("New Title")
      expect(track2.reload.artist).to eq("New Artist")
      expect(track2.reload.permalink_url).to eq("other_permalink_url")
      expect(track2.reload.stream_url).to eq("other_stream_url")
    end
  end
end
