class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      render :json => user.to_json
    else
      render status: 401, nothing: true
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
