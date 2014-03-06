require 'spec_helper'

describe PlaylistDecorator do
  let(:playlist) { FactoryGirl.create(:playlist) }
  subject { PlaylistDecorator.new(playlist)}

  describe "#total_duration" do
    before(:each) do
      FactoryGirl.create(:track, permalink_url: "track1", playlist: playlist, duration: 400_000)
      FactoryGirl.create(:track, permalink_url: "track2", playlist: playlist, duration: 1_000_000)
      FactoryGirl.create(:track, permalink_url: "track3", playlist: playlist, duration: 2_000_000)
    end

    its(:total_duration) { should eq(3_400_000) }
  end

end
