class AdminController < ApplicationController
  def index
    @tracks = Track.where(:playlist_id => nil)
  end

  def assign
    @playlist = Playlist.create(name: params[:playlist_name])
    params[:track_ids].each { |track_id| @playlist.tracks << Track.find(track_id) }
    redirect_to @playlist
  end
end
