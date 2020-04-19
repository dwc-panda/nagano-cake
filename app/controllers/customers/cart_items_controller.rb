class Customers::CartItemsController < ApplicationController

	def index
       @cart_items = CartItem.all
       # @items = @cart_item.item
       # @price_with_tax = cart_item.item.non_tax_price.to_i * 1.1
       # @subtotal = @price_with_tax * quantity
	end

	def create
		cart_item =CartItem.new(cart_items_params)
		cart_item.end_user_id = current_end_user.id
		cart_item.item_id = item.id
		if cart_item.save
		   redirect_back(fallback_location: root_path)
		end
	end

	def destoroy
		cart_item = CartItem.find(params[:id])
        cart_item.destoroy
        redirect_back(fallback_location: root_path, notice: "successfully delete")
	end
#destroyメソッドはwhereと併せて使うらしい
	def empty
		cart_item = CartItem.where(params[:id])
		cart_item.destroy_all
		redirect_back(fallback_location: root_path, notice: "successfully delete")
	end

	def update
		cart_item = CartItem.find(params[:id])
		cart_item.update
		redirect_back(fallback_location: root_path)
	end

	private
	def cart_items_params
		params.require(:cart_item).permit(:item_id, :quantity)
	end

end
