class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    @review=Review.new
  end

  def edit
    @review=Review.find_by(id: params[:id])
    if @review.user==current_user
      render 'edit'
    else
      redirect_to items_path
    end
  end

  def create
    item=Item.find(params[:item_id])
    @review=current_user.reviews.new(review_params)
    @review.item_id=item.id
    if @review.valid?
      @review.save
      redirect_to item_path(item), notice: "投稿しました"
    else
      render :new
    end
  end
  
  def update
    item=Item.find(params[:item_id])
    @review=Review.find_by(id: params[:id])
    if
      @review.update(review_params)
      redirect_to item_path(item), notice: "編集成功しました"
    else
      render :edit
    end
  end

  def destroy
    item=Item.find(params[:id])
    review=Review.find_by(item_id: params[:id],id: params[:item_id],)
    review.destroy
    redirect_to item_path(item), notice: "削除しました"
  end

  private

    def review_params
      params.require(:review).permit(:item_id,:user_id,:title,:text,:star,:re)
    end
end
