class Customers::DeliveriesController < ApplicationController
	before_action :authenticate_end_user!
	def create
		@delivery = Delivery.new(delivery_params)
		@delivery.end_user_id = current_end_user.id
		if @delivery.save
			flash[:notice] = "配送先が登録されました"
		   redirect_back(fallback_location: deliveries_path)
		else
		   @deliveries = Delivery.all
		   render :index
		end
	end

	def index
		@deliveries = Delivery.all
		@delivery = Delivery.new
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		@delivery = Delivery.find(params[:id])
		if @delivery.update(delivery_params)
		   redirect_to deliveries_path, notice: "配送先情報が更新されました"
		else
			render :edit
		end
	end

	def destroy
		@delivery = Delivery.find(params[:id])
		@delivery.destroy
		redirect_to deliveries_path
	end

	private
	def delivery_params
		params.require(:delivery).permit(:postcode, :direction, :address)
	end
end
