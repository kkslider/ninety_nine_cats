class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    
    render :new
  end
  
  def create
    @request = CatRentalRequest.new(params["cat_rental_request"])
    @request.save!
    cat = @request.cat
    
    redirect_to cat_url(cat)
  end
  
  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!
    cat = @request.cat
    
    redirect_to cat_url(cat)
  end
  
  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!
    cat = @request.cat
    
    redirect_to cat_url(cat)
  end
end