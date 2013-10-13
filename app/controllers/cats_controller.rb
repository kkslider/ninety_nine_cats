class CatsController < ApplicationController
  def index
    @cats = Cat.all
    
    render :index
  end
  
  def show
    @cat = Cat.find(params[:id])
    
    render :show
  end
  
  def new
    @cat = Cat.new
    @colors = Cat::COLORS
    
    render :new
  end
  
  def edit
    @cat = Cat.find(params[:id])
    @colors = Cat::COLORS
    
    render :edit
  end
  
  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(params["cat"])
    
    redirect_to cat_url(@cat)
  end
  
  def create
    @cat = Cat.new(params["cat"])
    @cat.save!
    
    redirect_to cat_url(@cat)
  end
  
  
end