require 'spec_helper'
require './app/models/track'
require './app/decorators/track_decorator'

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

  describe "#duration" do
    before(:each) { track.duration = 400_000 }
    its(:mix?) { should eq(false) }
  end

  describe "#mix?" do
    before(:each) { track.duration = 2_000_000 }
    its(:mix?) { should eq(true) }
  end
end
