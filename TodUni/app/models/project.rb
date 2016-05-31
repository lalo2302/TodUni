class Project < ActiveRecord::Base
	acts_as_taggable_on :tags
	enum status: [:en_progreso, :terminado, :cancelado]

	#TODO: Leer has many trough
	has_and_belongs_to_many :users
	has_many :stages
	has_many :comments
	belongs_to :city

	mount_uploader :picture, PictureUploader
	
	validates :name, presence: true
	validate :picture_size

	private
		# Validates the size of an uploaded picture.
		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
		end
end
