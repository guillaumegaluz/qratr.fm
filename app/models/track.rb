class Track < ActiveRecord::Base
  belongs_to :playlist

  validates_uniqueness_of :permalink_url
end
