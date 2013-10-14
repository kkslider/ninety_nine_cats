class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params["user"]["user_name"], params["user"]["password"])
    if user
      # user.reset_session_token! 
      # session[:session_token] = user.session_token
      login_user!(user)
      redirect_to cats_url
    else
      redirect_to new_session_url
    end
  end
  
  def new
    # @user = User.new
    
    render :new
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    
    redirect_to cats_url
  end
  
end