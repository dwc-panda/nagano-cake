class Admins::OrderDetailsController < ApplicationController
before_action :authenticate_admins_user!
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.item_status = params[:order_detail][:item_status]
		@order_detail.save
		@array_status = @order_detail.order.order_details.pluck(:item_status)
    	@array_status.delete("制作完了")
		if @order_detail.item_status == "制作中"
			@order_detail.order.order_status = "制作中"
			@order_detail.order.update(order_status: 2)
		elsif @array_status.length == 0
			@order_detail.order.update(order_status: 3)
		end
		@order_detail.order
		redirect_to admins_order_path(@order_detail.order)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:item_status)
	end
end


