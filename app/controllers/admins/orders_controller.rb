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
    # @order.update(order_params)
    # redirect_to admins_orders_path
    @order.update(order_params)
    if @order.order_status == "入金確認"
        @order.order_details.each do |order_detail|
          order_detail.item_status = 1
          order_detail.save
        end
    end
    redirect_to admins_orders_path
  end

  private
    def order_params
      params.require(:order).permit(:order_status)
    end

    def order_detail_params
      params.require(:order).permit(:item_status)
    end

end