class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
    @makers=Maker.all
    @genres=Genre.all
    @arcs=Arc.all
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private

    #itemから欲しいデータのみ抽出
    def item_params
        params.require(:item).permit(:user_id,:item_name,:item_image,:item_text)
    end
end
