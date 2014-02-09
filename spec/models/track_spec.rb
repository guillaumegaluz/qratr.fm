require 'spec_helper'
require './app/models/track'

describe Track do
  it { should validate_uniqueness_of(:permalink_url) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:artist) }
  it { should validate_presence_of(:permalink_url) }
  it { should validate_presence_of(:stream_url) }
end
