class Customers::CartItemsController < ApplicationController
before_action :authenticate_end_user!
	def index
       @cart_items = CartItem.where(end_user_id: current_end_user.id)
       # cart_item = CartItem.find(params[:id])
       # @items = @cart_item.item
       # @price_with_tax = @cart_item.item.non_tax_price.to_i * 1.1
       # @subtotal = @price_with_tax * quantity
	end

	def create
		cart_item =CartItem.new(cart_items_params)
		cart_item.end_user_id = current_end_user.id
		if current_end_user.cart_items.where(item_id: cart_item.item_id).exists?#cart_item.item_idパラメータで渡しているcart_itemに紐づくitem_id
			 redirect_back(fallback_location: root_path, notice: "カートに商品はあります。")
		else
			 cart_item.save
		   redirect_to cart_items_path, notice: "カートに商品を入れました。"
		end
	end
#destroyメソッドはwhereと併せて使うらしい
	def empty
		cart_item = CartItem.where(params[:id])
		cart_item.destroy_all
		redirect_back(fallback_location: root_path, notice: "successfully delete")
	end

	def destroy
		cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_back(fallback_location: root_path, notice: "successfully delete")
	end

	def update
		cart_item = CartItem.find(params[:id])
		# cart_item.update
		cart_item.update(cart_items_params)
		redirect_back(fallback_location: root_path)
	end

	private
	def cart_items_params
		params.require(:cart_item).permit(:item_id, :quantity)
	end

end
