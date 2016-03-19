class Etapa < ActiveRecord::Base
	
	enum estatus: [:inactiva, :en_progreso, :finalizada]

	belongs_to :proyecto
	has_many :evidencias
end
