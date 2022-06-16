class ItemsController < ApplicationController
   def index
    @items=Item.all
    @items = Item.page(params[:page]).per(6)
  end

  def show
    @item=Item.find(params[:id])
    @review=@item.reviews.all.count
    @items=@item.reviews.page(params[:page]).per(3)
    @reviews=Review.all
  end
end
