class UsersController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.new(params["user"])
    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      redirect_to new_user_url
    end
  end
end