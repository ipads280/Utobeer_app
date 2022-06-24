class Admin::ReviewsController < ApplicationController
  def edit
    @review=Review.find_by(id: params[:id])
    if @review.user==current_user
      render 'edit'
    else
      redirect_to items_path
    end
  end
end
