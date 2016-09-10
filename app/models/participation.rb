class Participation < ActiveRecord::Base
	enum role: [:member, :admin, :owner]

	belongs_to :user
	belongs_to :project
end
