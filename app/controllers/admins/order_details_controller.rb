class Admins::OrderDetailsController < ApplicationController

	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.item_status = params[:order_detail][:item_status]
		@order_detail.save
		redirect_to admins_orders_path
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:item_status)
	end
end