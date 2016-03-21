class City < ActiveRecord::Base
	has_many :projects
	belongs_to :state
end
