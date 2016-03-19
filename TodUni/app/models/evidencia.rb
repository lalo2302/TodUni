class Evidencia < ActiveRecord::Base
	belongs_to :etapa
	belongs_to :user
end
