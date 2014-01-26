class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.find_or_create_by_email(params[:email])
    respond_to do |format|
      format.js { render :json => {email: @subscriber.email}.to_json }
    end
  end
end
