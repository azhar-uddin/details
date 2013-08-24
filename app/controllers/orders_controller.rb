class OrdersController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.create(params[:order].permit(:name, :details))
    redirect_to customer_path(@customer)
  end
  
  def destroy
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
    @order.destroy
    redirect_to customer_path(@customer)
  end
end
