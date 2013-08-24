class SuppliersController < ApplicationController

  def create
    render text: params[:supplier].inspect
  end
  
  def new
  end
  
  
end
