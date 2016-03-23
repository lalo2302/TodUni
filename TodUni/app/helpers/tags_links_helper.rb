# app/helpers/tags_links_helper.rb
module TagsLinksHelper
	def add_links(tag_list)
		tag_list.map{ |t| link_to t, tag_path(t) }.join(', ')
	end
end