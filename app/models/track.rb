class Track < ActiveRecord::Base
  belongs_to :playlist

  has_many :favorites, foreign_key: "favorited_track_id"
  has_many :users, through: :favorites

  validates_uniqueness_of :permalink_url
  validates_presence_of :title, :artist, :permalink_url, :stream_url
end
