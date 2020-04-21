class Customers::HomesController < ApplicationController
	def top
	  @genre = Genre.all
	  @items = Item.all.shuffle.first(4)
	end

	def about
	end
end
