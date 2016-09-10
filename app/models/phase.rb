class Phase < ActiveRecord::Base
	
	enum status: [:inactive, :in_progress, :finished]
  enum type: [:analysis, :design, :build, :closure]

	belongs_to :project
	has_many :evidences
end
