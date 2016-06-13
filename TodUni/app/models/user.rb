class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :evidences
	has_many :participations
	has_many :projects, -> { distinct }, through: :participations

	validates :name, presence: true

	def self.types
		%w(Mentor)
	end

	scope :mentors, -> { where(type: 'Mentor') }  


  def complete?
    @complete = true
    if self.name.blank? || self.date_birth.blank?
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
end
