class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited_track, class_name: "Track"

  # validates_uniqueness_of :user_id, :scope => :favorited_track_id
end
