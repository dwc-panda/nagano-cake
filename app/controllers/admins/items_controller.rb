class Admins::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
    @item.save
  	redirect_to admins_items_path
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :genre_id, :non_taxed_price, :is_valid)
  end
end
