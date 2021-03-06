class FavoritesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  

  def create
    @favorite = Favorite.new(user_id: current_user.id,item_id: @item.id)
    @favorite.save
    #redirect_to item_path(@item.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id,item_id: @item.id)
    @favorite.destroy
    #redirect_to item_path(@item.id)
  end

  private

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end
end
