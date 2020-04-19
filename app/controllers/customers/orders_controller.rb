class Customers::OrdersController < ApplicationController
  def index #注文履歴一覧
  	@orders = Order.all
  end

  def new #注文登録画面
  	@order = Order.new
  end

  def confirm #注文確認画面

  end

  def create #注文情報登録
    order = Order.new(order_params)
  end

  def show #注文履歴詳細
    @order = Oder.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:total_price, :postcode, :address, :direction, :payment_type)
  end

end
