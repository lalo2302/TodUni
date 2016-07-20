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
	validates :description, presence: true
	#validate :picture_size

  def owner
    self.participations.where(role: 2).first.user
  end
	private
		# Validates the size of an uploaded picture.
		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
		end
end
