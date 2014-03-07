require 'spec_helper'

describe TrackDecorator do
  subject { TrackDecorator.new(track)}
  let(:track) { FactoryGirl.build(:track) }

  describe "#artwork_url" do
    context "when the track doesn't have an artwork url" do
      its(:artwork_url) { should eq("http://www.whosampled.com/static/track_images_100/mr8231_201031_132914965488.jpg") }
    end

    context "when the track has an artwork url" do
      before(:each) { track.artwork_url = "hello" }
      its(:artwork_url) { should eq("hello") }
    end
  end

  describe "#mix?" do
    context "the track has no duration" do
      its(:mix?) { should eq(false) }
    end

    context "when the track's duration is lower than 20 minutes" do
      before(:each) { track.duration = 2_000_000 }
      its(:mix?) { should eq(true) }
    end

    context "when the track's duration is lower than 20 minutes" do
      before(:each) { track.duration = 100_000 }
      its(:mix?) { should eq(false) }
    end
  end
end
