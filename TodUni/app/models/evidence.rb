class Evidence < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user
end
