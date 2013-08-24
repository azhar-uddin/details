class CustomersController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  def new
    @customer=Customer.new
  end
  
  def create
    @customer=Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
    
  end
  
  def show
  #raise params[:id].inspect
  @customer=Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
   
    if @customer.update(params[:customer].permit(:name, :description))
      redirect_to @customer
    else
      render 'edit'
    end
  end
  
  def destroy
  @customer = Customer.find(params[:id])
  @customer.destroy
 
  redirect_to customers_path
end
  
  def index
    @customers=Customer.all
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :description)
  end
  
end
