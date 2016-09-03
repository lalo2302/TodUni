class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	enum locale: [:en, :es]

  has_many :evidences
	has_many :participations
	has_many :projects, -> { distinct }, through: :participations

  mount_uploader :avatar, PictureUploader

  #validate :picture_size

	def self.types
		%w(Mentor)
	end

	scope :mentors, -> { where(type: 'Mentor') }  

  def complete?
    @complete = true
    if self.name.blank? || self.date_birth.blank? || self.avatar.file.nil?
      @complete = false
    end
    @complete
  end

	def own_project(project)
		self.projects << project
		participation = self.participations.where(:project => project).limit(1).first
		participation.role = :owner
		participation.save
	end	

  def is_owner?(project)
    projects = self.owned_projects
    if projects.include? project 
      return true
    else
      return false
    end
  end

  def owned_projects
    projects = []
    participations = self.participations.where(role: 2)
    participations.each do |part|
      projects << part.project
    end
    return projects
  end

	private
		# Validates the size of an uploaded picture.
		def picture_size
			if picture.size > 5.megabytes
				errors.add(:picture, "should be less than 5MB")
			end
    end
end
