class Admin::ArcsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @arc=Arc.new
    @arcs=Arc.all
  end

  def create
    @arc=Arc.new(arc_params)
    if @arc.valid?
      @arc.save
      redirect_to admin_arcs_path
    else
      @arcs=Arc.all
      render :index
    end
  end
  
  def edit
    @arc=Arc.find(params[:id])
  end
  
  def update
    arc=Arc.find(params[:id])
    arc.update(arc_params)
    redirect_to admin_arcs_path
  end
  
  def destroy
    arc=Arc.find(params[:id])
    arc.destroy
    redirect_to admin_arcs_path
  end
  
  private

  def arc_params
    params.require(:arc).permit(:arcs_name)
  end
end
