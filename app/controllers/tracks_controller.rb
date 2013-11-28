class TracksController < ApplicationController

  def create
    @track = TrackCreator.new(params[:url]).build
  end

end
