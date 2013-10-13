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
    @colors = Cat::COLORS
    
    render :new
  end
  
  
end