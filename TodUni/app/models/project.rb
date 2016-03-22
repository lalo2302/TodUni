class Project < ActiveRecord::Base

	enum status: [:en_progreso, :terminado, :cancelado]

	has_and_belongs_to_many :users
	has_many :stages
	has_and_belongs_to_many :hashtags
	has_many :comments
	belongs_to :city
	accepts_nested_attributes_for :users

	validates :name, presence: true
	validates :users, inclusion: { in: User.all,
		message: "%{value} is not a valid username" }
end
