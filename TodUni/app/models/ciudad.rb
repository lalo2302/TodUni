class Ciudad < ActiveRecord::Base
	has_many :proyectos
	belongs_to :estado
end
