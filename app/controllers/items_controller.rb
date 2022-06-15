class ItemsController < ApplicationController
   def index
    @items=Item.all
    @items = Item.page(params[:page]).per(6)
  end

  def show
    @item=Item.find(params[:id])
    @reviews=Review.all
  end
end
