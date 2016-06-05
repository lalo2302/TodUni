class Phase < ActiveRecord::Base
	
	enum status: [:inactiva, :en_progreso, :finalizada]

	belongs_to :project
	has_many :evidences
end
