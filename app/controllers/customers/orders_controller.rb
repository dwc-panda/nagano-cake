class Customers::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def new
  	@order = Order.new
  end

  def confirm
  	@order = Order.new(order_params)
  end

  def create
  end

  def show
    @order = current_order.find(params[:id])
    @orders = Order_detail.all
    @price_sum = current_order.postage + current_order.total_price
  end

  def thanks
  end
end
