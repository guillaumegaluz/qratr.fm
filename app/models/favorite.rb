class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited_track, class_name: "Track"
end
