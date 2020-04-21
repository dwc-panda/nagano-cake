class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all

  end

  def show
  	@orders = Order.all
  	@order = Order.find(params[:id])


  end

  def update
  	@order = Order.find(params[:id])
    @order.order_status = params[:order][:order_status].to_i
      @order.update(order_params)
     redirect_to admins_orders_path
  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end

end