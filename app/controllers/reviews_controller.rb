class ReviewsController < ApplicationController
  def create
    item=Item.find(params[:item_id])
    review=current_user.reviews.new(review_params)
    review.item_id=item.id
    review.save
    redirect_to item_path(item)
    
  end

  private

    def review_params
      params.require(:review).permit(:item_id,:user_id,:title,:text,:star)
    end
end
