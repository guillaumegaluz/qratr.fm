class Track < ActiveRecord::Base
  belongs_to :playlist

  validates_uniqueness_of :permalink_url
  validates_presence_of :title, :artist, :permalink_url, :stream_url
end
