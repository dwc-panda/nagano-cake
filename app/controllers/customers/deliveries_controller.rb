class Customers::DeliveriesController < ApplicationController

	def create
		@delivery = Delivery.new(delivery_params)
		@delivery.end_user_id = current_end_user.id
		@delivery.save
		redirect_back(fallback_location: deliveries_path)
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
		@delivery.update(delivery_paramas)
		redirect_to deliveries_path
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
