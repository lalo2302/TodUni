class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create, :update]
  
  def after_sign_in_path_for(resource)
    dashboard_path(current_user)
  end

  def after_sign_up_path_for(resource)
    dashboard_path(current_user)
  end

  

protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :name, :birth_date) }
    end

end