class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def edit
    @review=Review.find_by(id: params[:id])
  end
  
  def update
    item=Item.find(params[:item_id])
    @review=Review.find_by(id: params[:id])
    if
      @review.update(review_params)
      redirect_to admin_item_path(item), notice: "編集成功しました"
    else
      render :edit
    end
  end

  def destroy
    item=Item.find(params[:id])
    review=Review.find_by(item_id: params[:id],id: params[:item_id],)
    review.destroy
    redirect_to admin_item_path(item), notice: "削除しました"
  end
  
  private

    def review_params
      params.require(:review).permit(:item_id,:user_id,:title,:text,:star,:re)
    end
end
