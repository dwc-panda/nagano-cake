class Customers::GenresController < ApplicationController
  def search
  	#ジャンルに紐づく商品の探し方。whereメソッドでアイテムテーブルの中にあるジャンルＩＤを取り出す。
  	@items = Item.where(genre_id: params[:id])

  end
end
