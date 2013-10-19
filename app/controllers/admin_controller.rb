class AdminController < ApplicationController
  def index
    @tracks = Track.where(:playlist_id => nil)
  end
end
