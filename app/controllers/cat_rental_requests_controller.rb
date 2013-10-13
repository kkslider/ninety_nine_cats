class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    
    render :new
  end
  
  
  
end