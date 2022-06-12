class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
    @items = Item.page(params[:page]).per(6)
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
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
    @makers=Maker.all
    @arcs=Arc.all
    @genres=Genre.all
  end

  def update
    item=Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end
  
  private

    #itemから欲しいデータのみ抽出
    def item_params
        params.require(:item).permit(:user_id,:item_name,:item_image,:item_text,:genre_id,:maker_id,:item_price,:arc_id,:created_at,:updated_at,:image)
    end
end
