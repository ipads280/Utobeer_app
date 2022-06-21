class HomesController < ApplicationController
  
  def top
   @reviews=Review.order(created_at: :desc).limit(3)
   @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
  end

  def about
  end
end
