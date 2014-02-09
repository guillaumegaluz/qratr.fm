require 'spec_helper'
require './lib/track_creator'

describe TrackCreator do
  describe ".build" do
    before(:each) do
      FactoryGirl.create(:track)
      attributes = {
        title: "Philip Glass",
        artist: "Opening",
        permalink_url: "different_url",
        stream_url: "soundcloud_url/philipglass/stream"
      }
      SoundCloudAPI.stub(:track_hash) { attributes }
    end

    context "when a track with the given track url already exists" do
      it "returns the given track" do
        expect{ TrackCreator.build("soundcloud_url") }.to_not change{ Track.count }
        expect(Track.last.permalink_url).to eq("soundcloud_url")
      end
    end

    context "when no track with the given track url exists" do
      it "creates a new track" do
        expect{ TrackCreator.build("different_url") }.to change{ Track.count }.from(1).to(2)
        expect(Track.last.permalink_url).to eq("different_url")
      end
    end
  end
end
