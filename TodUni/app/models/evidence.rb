class Evidence < ActiveRecord::Base
	belongs_to :phase
	belongs_to :user
end
