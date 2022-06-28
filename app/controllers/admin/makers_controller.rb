class Admin::MakersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @maker=Maker.new
    @makers=Maker.all
  end

  def create
    @maker=Maker.new(maker_params)
    if @maker.valid?
      @maker.save
      redirect_to admin_makers_path, notice: "投稿しました"
    else
      @makers=Maker.all
      render :index
    end
  end
  
  def edit
    @maker=Maker.find(params[:id])
  end
  
  def update
    maker=Maker.find(params[:id])
    maker.update(maker_params)
    redirect_to admin_makers_path, notice: "編集成功しました"
  end
  
  def destroy
    maker=Maker.find(params[:id])
    maker.destroy
    redirect_to admin_makers_path, notice: "削除しました"
  end
  
  private

  def maker_params
    params.require(:maker).permit(:makers_name)
  end
end
