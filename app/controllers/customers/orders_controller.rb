class Customers::OrdersController < ApplicationController
  def index #注文履歴一覧
  	@orders = Order.all
  end

  def new #注文登録画面
  	@order = Order.new
  end

  def confirm #注文確認画面
    if order_params[:select_address] == "1"
      @address = current_end_user.address
      @postcode = current_end_user.postcode
      @direction = current_end_user.first_name
    elsif order_params[:select_address] == "2"
      delivery = Delivery.find(order_params[:address_id])
      @address = delivery.address
      @postcode = delivery.postcode
      @direction = delivery.direction
    else
      @address = order_params[:address]
      @postcode = order_params[:postcode]
      @direction = order_params[:direction]
    end
    @cart_items = current_end_user.cart_items
    @payment_type = order_params[:payment_type]
    @total_price = 0
    current_end_user.cart_items.each do |cart_item|
      @total_price.to_i += cart_item.item.non_taxed_price * 1.1
    end
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.end_user_id = current_end_user.id
    order.tax = 1.1
    order.save
    redirect_to thanks_path
  end

  def show
    @order = current_order.find(params[:id])
    @orders = Order_detail.all
    @price_sum = current_order.postage + current_order.total_price
  end

  private
  def order_params
    params.require(:order).permit(:total_price, :postcode, :address, :direction, :payment_type, :select_address, :address_id)
  end

end
