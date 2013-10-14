class CatRentalRequestsController < ApplicationController
  before_filter :require_owner_for_approval!, only: [:approve, :deny]
  
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
  
  private
  
  def current_request
    @current_request ||= CatRentalRequest.find(params[:id])
  end
  
  def cat_requested
    Cat.find(current_request.cat_id)
  end
  
  def require_owner_for_approval!
    #flash error
    redirect_to cat_url(cat_requested) unless cat_requested.owner == current_user
  end
  
  
  
end