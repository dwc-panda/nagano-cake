class Customers::ItemsController < ApplicationController

	def index

		@items = Item.all
		# @item = Item.find(params[:id])
	end

	def show
		@item = Item.find(params[:id])
		@cart_item =CartItem.new(cart_items_params)
	end
end