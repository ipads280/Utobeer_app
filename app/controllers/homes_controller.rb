class HomesController < ApplicationController
  
  def top
   @reviews=Review.order(created_at: :desc).limit(5)
   @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').limit(2).pluck(:item_id))
   @random = Item.order("RAND()").limit(1)
  end

  def about
  end
end
