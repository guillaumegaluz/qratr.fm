class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render :json => @user.to_json
    else
      render status: 401, nothing: true
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
