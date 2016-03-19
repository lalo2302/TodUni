class Proyecto < ActiveRecord::Base

	enum estatus: [:en_progreso, :terminado, :cancelado]

	has_and_belongs_to_many :users
	has_many :etapas
	has_and_belongs_to_many :hashtags
	has_many :comentarios
	belongs_to :ciudad

end
