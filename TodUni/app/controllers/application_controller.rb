class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_action :set_i18n_locale_from_params

  def after_sign_in_path_for(resource)
    dashboard_path(current_user)
  end

	private

		def set_i18n_locale_from_params
			if params[:locale]
				if I18n.available_locales.map(&:to_s).include?(params[:locale])
					I18n.locale = params[:locale]
				else
					flash.now[:notice] = "#{params[:locale]} translation not available"
					logger.error flash.now[:notice]
				end
			end
		end

		def default_url_options(options = {})
			{locale: I18n.locale}
		end

end
