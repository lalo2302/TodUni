module ApplicationHelper
	def form_errors_for(object=nil)
		render('shared/error_messages', object: object) unless object.blank?
	end

	def locale_name(locale)
		case locale
		when "en"
			I18n.t("en")	
		when "es"
			I18n.t("es")
		end
	end

end
