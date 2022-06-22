class ItemsController < ApplicationController
  def index
    @items=Item.all
    @items = Item.page(params[:page]).per(6)
    
  end

  def show
    @item=Item.find(params[:id])
    @reviews=@item.reviews
    @reviews = @item.reviews.page(params[:page]).per(3)

    respond_to do |format|
      format.html
      format.js
    end
  end
  
　def search
    method = params[:search_method]
    word = params[:search_word]
    @items = Item.search(method,word)
　end
end
