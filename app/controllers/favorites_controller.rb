class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render :json => favorite.to_json
    else
      render status: 401, nothing: true
    end
  end

  def destroy
    favorite = Favorite.find_by_user_id_and_favorited_track_id(params[:favorite][:user_id], params[:favorite][:favorited_track_id])
    favorite.destroy
    render :json => { success: true }
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :favorited_track_id)
  end
end
