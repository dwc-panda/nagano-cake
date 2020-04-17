class Customers::HomesController < ApplicationController
	def top
	  @genre = Genre.all
	end
end
