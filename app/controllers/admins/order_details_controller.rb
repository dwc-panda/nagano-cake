class Admins::OrderDetailsController < ApplicationController

	# def update
	# 	@order_detail = OrderDetail.find(params[:id])
	# 	@order_detail.item_status = params[:order_detail][:item_status].to_i

	# 	@order_detail.update(order_detail_params)
	# 	redirect_to admins_orders_path
	# end
	# 梶谷さん修正後
	 def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.item_status = params[:order_detail][:item_status]
		@order_detail.save
		#挙動確認のためredirect_backに変更
		redirect_back(fallback_location: root_path)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:item_status)
	end
end