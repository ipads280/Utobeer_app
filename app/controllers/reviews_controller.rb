class ReviewsController < ApplicationController
  def new
    @review=Review.new
  end

  def edit
    @review=Review.find_by(item_id: params[:id],id: params[:item_id])
  end

  def create
    item=Item.find(params[:item_id])
    review=current_user.reviews.new(review_params)
    review.item_id=item.id
    review.save
    redirect_to item_path(item)
  end
  
  def update
    item=Item.find(params[:item_id])
    review=Review.find_by(item_id: params[:id],id: params[:item_id])
    review.item_id=item.id
    review.update(review_params)
    redirect_to item_path(item)
  end

  def destroy
    item=Item.find(params[:id])
    review=Review.find_by(item_id: params[:id],id: params[:item_id],)
    review.destroy
    redirect_to item_path(item)
  end

  private

    def review_params
      params.require(:review).permit(:item_id,:user_id,:title,:text,:star,:re)
    end
end
