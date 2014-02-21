require 'spec_helper'

describe TrackCreator do
  describe ".build" do
    before(:each) do
      FactoryGirl.create(:track)
      new_attributes = {
        title: "New Title",
        artist: "New Artist",
        permalink_url: "new_permalink_url",
        stream_url: "new_stream_url"
      }
      SoundCloudAPI.stub(:track_hash) { new_attributes }
    end

    context "when a track with the given track url already exists" do
      it "returns the given track" do
        expect{ TrackCreator.build("permalink_url") }.to_not change{ Track.count }
        expect(Track.last.permalink_url).to eq("permalink_url")
      end
    end

    context "when no track with the given track url exists" do
      it "creates a new track" do
        expect{ TrackCreator.build("new_permalink_url") }.to change{ Track.count }.from(1).to(2)
        expect(Track.last.permalink_url).to eq("new_permalink_url")
      end
    end
  end
end
