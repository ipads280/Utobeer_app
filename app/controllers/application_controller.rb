class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  

  protected
  def set_search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
