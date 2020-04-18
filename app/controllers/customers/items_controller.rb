class Customers::ItemsController < ApplicationController

	def index

		@items = Item.all
		# @item = Item.find(params[:id])
	end

	def show
		@item = Item.find(params[:id])
	end
end