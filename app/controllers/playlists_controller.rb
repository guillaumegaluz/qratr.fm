class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render :json => @playlist.as_json_with_tracks.to_json }
    end
  end
end
