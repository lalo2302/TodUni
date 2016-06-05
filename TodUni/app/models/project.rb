class Project < ActiveRecord::Base
	acts_as_taggable_on :tags
	enum status: [:preproyecto, :en_progreso, :terminado, :cancelado]

	belongs_to :mentor
	belongs_to :city
	has_many :phases
	has_many :comments
	has_many :participations
	has_many :users, -> { distinct }, through: :participations

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
