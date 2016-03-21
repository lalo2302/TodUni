class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    dashboard_path(current_user)
  end

end