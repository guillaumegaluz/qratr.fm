class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render :json => favorite.to_json
    else
      render status: 401, nothing: true
    end
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :favorited_track_id)
  end
end
