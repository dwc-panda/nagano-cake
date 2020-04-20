class Customers::OrdersController < ApplicationController
  def index #注文履歴一覧
  	@orders = Order.where(end_user_id: current_end_user.id)
  end

  def new #注文登録画面
  	@order = Order.new
  end

  def confirm #注文確認画面。分岐ごとに代入する値を定義
    if order_params[:select_address] == "1" #お届け先でご自身の住所を選んだ場合
      @address = current_end_user.address
      @postcode = current_end_user.postcode
      @direction = current_end_user.first_name
    elsif order_params[:select_address] == "2" #お問合せで登録済み住所から選択を選んだ場合
      delivery = Delivery.find(order_params[:address_id])
      @address = delivery.address
      @postcode = delivery.postcode
      @direction = delivery.direction
    else #お届け先で新しいお届け先を選んだ場合
      @address = order_params[:address]
      @postcode = order_params[:postcode]
      @direction = order_params[:direction]
    end
    @cart_items = current_end_user.cart_items
    @payment_type = order_params[:payment_type]
    @total_price = 0
    current_end_user.cart_items.each do |cart_item|
      @total_price += cart_item.item.non_taxed_price * 1.1.floor * cart_item.quantity #請求金額
    end
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    order.end_user_id = current_end_user.id
    order.order_status = 0
    order.postage = 800
    order.tax = 1.1
    order.save #注文確定
    current_end_user.cart_items.each do |cart_item| #注文詳細履歴作成
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item.id
      order_detail.price = cart_item.item.non_taxed_price
      order_detail.quantity = cart_item.quantity
      order_detail.item_status = 0
      order_detail.order_id = order.id
      order_detail.save #注文履歴保存
    end
    current_end_user.cart_items.destroy_all #カートを空にする
    redirect_to thanks_path
  end

  def show
    @order = Order.find(params[:id])
    # @order.order_details = OrderDetail.where(order_id: @order.id)
    # @price_sum = order_detail.price * order_detail.quantity

  end

  private
  def order_params
    params.require(:order).permit(:total_price, :postcode, :address, :direction, :payment_type, :select_address, :address_id)
  end

end
