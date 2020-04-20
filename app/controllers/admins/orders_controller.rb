class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
  	@orders = Order.all
  	@order = Order.find(params[:id])

  end

  def update
  	@order = Order.find(order_params)
  	@order.update

  end

  private
    def order_params
      params.require(:order).parmit(:order_status)
    end
end
