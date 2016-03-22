class Project < ActiveRecord::Base

	enum status: [:en_progreso, :terminado, :cancelado]

	has_and_belongs_to_many :users
	has_many :stages
	has_and_belongs_to_many :hashtags
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
