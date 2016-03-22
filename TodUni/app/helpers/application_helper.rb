module ApplicationHelper
	def form_errors_for(object=nil)
		render('shared/error_messages', object: object) unless object.blank?
	end
end
