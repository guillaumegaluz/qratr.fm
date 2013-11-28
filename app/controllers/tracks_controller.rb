class TracksController < ApplicationController

  def create
    TrackCreator.new(params[:url]).build
  end
  
end
