class FavoritesController < ApplicationController
  def create
    Favorite.create(favorite_params)
    render status: 200, nothing: true
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :favorited_track_id)
  end
end
