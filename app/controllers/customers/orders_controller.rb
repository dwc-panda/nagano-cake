class Customers::OrdersController < ApplicationController
  def index #注文履歴一覧
  	@orders = Order.all
  end

  def new #注文登録画面
  	@order = Order.new
  end

  def confirm #注文確認画面

  end
  
  def create
  end

  def show
    @order = current_order.find(params[:id])
    @orders = Order_detail.all
    @price_sum = current_order.postage + current_order.total_price
  end

  private
  def order_params
    params.require(:order).permit(:total_price, :postcode, :address, :direction, :payment_type)
  end

end
