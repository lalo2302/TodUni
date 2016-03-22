class Project < ActiveRecord::Base

	enum status: [:en_progreso, :terminado, :cancelado]

	has_and_belongs_to_many :users
	has_many :stages
	has_and_belongs_to_many :hashtags
	has_many :comments
	belongs_to :city

	validates :name, presence: true
end
