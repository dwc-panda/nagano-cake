class Admins::OrdersController < ApplicationController
  before_action :authenticate_admins_user!
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

    # if @order.update(order_params) == 0
    #   @order_datail = Order.find(params[:order_id])
    #   @order_datail.item_status = 0
    #   @order_datail.save
    # elsif @order.update(order_params) == 1
    #   @order_datail = Order.find(params[:order_id])
    #   @order_datail.item_status = 1
    #   @order_datail.save
    # elsif @order.update(order_params) == 2
    #   @order_datail = Order.find(params[:order_id])
    #   @order_datail.item_status = 2
    #   @order_datail.save
    # else
    #   @order_datail = Order.find(params[:order_id])
    #   @order_datail.item_status = 3
    #   @order_datail.save
    # end
    # redirect_to admins_orders_path
  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end

end