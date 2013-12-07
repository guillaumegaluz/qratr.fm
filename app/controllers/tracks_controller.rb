class TracksController < ApplicationController

  def create
    @track = TrackCreator.new(params[:url]).build
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attribute(:listen_count, params[:listen_count])
    render :nothing => true
  end
end
