class State < ActiveRecord::Base
	has_many :cities
	has_many :projects, through: :cities
end
