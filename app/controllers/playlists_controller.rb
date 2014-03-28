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

  def new
    @playlist = Playlist.new
  end

  def last
    @playlist = Playlist.last
    render "show"
  end

  def track
    @playlist = Playlist.find(params[:playlist_id])
    @track = @playlist.tracks.find(params[:track_id])
    @track_id = @track.id
    render :show
  end
end
