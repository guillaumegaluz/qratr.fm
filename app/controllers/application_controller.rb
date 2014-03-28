class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render 'public/404.html', :status => 404
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id])  if session[:user_id]
  end
end
