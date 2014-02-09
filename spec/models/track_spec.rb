require 'spec_helper'
require './app/models/track'

describe Track do
  it { should validate_uniqueness_of(:permalink_url) }
end
