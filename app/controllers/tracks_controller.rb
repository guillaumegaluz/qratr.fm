class TracksController < ApplicationController
  def create
    @track = TrackCreator.build(params[:url])
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attribute(:play_count, params[:play_count])
    render :nothing => true
  end
end
