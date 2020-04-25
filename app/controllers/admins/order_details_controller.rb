class Admins::OrderDetailsController < ApplicationController
before_action :authenticate_admins_user!
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.item_status = params[:order_detail][:item_status]
		@order_detail.save
		# @array_status = @order_detail.order.order_details.pluck(:item_status)
    #@array_status.delete("製作完了")
    @a = @order_detail.order.order_details.pluck(:item_status) #製作ステータスのみを配列にして変数@aに代入
		if @order_detail.item_status == "製作中"
			@order_detail.order.order_status = "製作中"
			@order_detail.order.update(order_status: 2)
		# elsif @array_status.length == 0
	  elsif @a.count("製作完了") == @order_detail.order.order_details.count #@aの中の"製作完了"を数えて注文詳細履歴の数と比較
			@order_detail.order.update(order_status: 3) #elsifの条件がtrueの場合、全ての注文詳細履歴の製作ステータスが製作完了ということなので注文ステータスを更新する
		end
		@order_detail.order
		redirect_to admins_order_path(@order_detail.order)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:item_status)
	end
end




