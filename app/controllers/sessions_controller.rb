class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params["user"])
    user.reset_session_token! if user
    session[:session_token] = user.session_token
    
    redirect_to cats_url
  end
  
  def new
    # @user = User.new
    
    render :new
  end
end