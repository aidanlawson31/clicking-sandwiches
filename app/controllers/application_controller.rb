class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_business

  protected

  def after_sign_in_path_for(resource)
    if current_user.business
      business_path(current_user.business)
    else
      new_business_path(current_user)
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:admin, :first_name, :last_name, :email, :password, :password_confirmation)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:admin, :first_name, :last_name, :email, :password, :current_password)}
  end

  def current_business
    if current_user
      return current_user.business
    else
      return Business.find_by(business_url: params[:business_url])
    end
  end
end
