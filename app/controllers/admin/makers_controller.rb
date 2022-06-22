class Admin::MakersController < ApplicationController
  def index
    @maker=Maker.new
    @makers=Maker.all
  end

  def create
    @maker=Maker.new(maker_params)
    if @maker.valid?
      @maker.save
      redirect_to admin_makers_path
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
    redirect_to admin_makers_path
  end
  
  def destroy
    maker=Maker.find(params[:id])
    maker.destroy
    redirect_to admin_makers_path
  end
  
  private

  def maker_params
    params.require(:maker).permit(:makers_name)
  end
end
