class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  def edit
    @review=Review.find_by(id: params[:id])
    if @review.user==current_user
      render 'edit'
    else
      redirect_to items_path
    end
  end
end
