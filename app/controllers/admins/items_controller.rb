class Admins::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to admins_item_path(@item)
  	else
  		render :new
  	end
  end

  def show
  	@item = Item.all
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :janle_id, :non_taxed_price, :is_valid)
  end
end
