class Admins::OrderDetailsController < ApplicationController


	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.item_status = params[:order_detail][:item_status]
		@order_detail.save
		@order_detail.order
		redirect_to admins_order_path(@order_detail.order)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:item_status)
	end
end