class Phase < ActiveRecord::Base
	
	enum status: [:inactive, :in_progress, :finished]

	belongs_to :project
	has_many :evidences
end
