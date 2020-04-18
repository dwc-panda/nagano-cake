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
  end

  def thanks
  end
end
