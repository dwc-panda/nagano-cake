class Customers::ItemsController < ApplicationController

	def index
		@items = Item.all
		# @item = Item.find(params[:id])
		@items = Item.page(params[:page])
	end

	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
	end
end