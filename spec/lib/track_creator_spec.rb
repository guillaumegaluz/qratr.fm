require 'spec_helper'
require './lib/track_creator'

describe TrackCreator do
  describe ".build" do
    before(:each) do
      Track.create(permalink_url: "existing_url")
      SoundCloudAPI.stub(:track_hash)
    end

    context "when a track with the given track url already exists" do
      it "returns the given track" do
        expect{ TrackCreator.build("existing_url") }.to_not change{ Track.count }
        expect(Track.last.permalink_url).to eq("existing_url")
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
