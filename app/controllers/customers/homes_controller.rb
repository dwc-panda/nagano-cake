class Customers::HomesController < ApplicationController
	def top
	  @genre = Genre.all
	  @item = Item.find(params[:id])

	end
end
