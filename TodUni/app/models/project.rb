class Project < ActiveRecord::Base
  attr_accessor :email
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

  def owner
    self.participations.where(role: 2).first.user
  end

  def owner?(user)
    if self.owner == user
      true
    else
      false
    end
  end

  def members
    members = []
    participations = self.participations.where(role: 0)
    participations.each do |part|
      members << part.user
    end
    return members
  end

  def member?(user)
    participants = []
    participations = self.participations
    participations.each do |part|
      if user == part.user
        return true
      end
    end
    return false
  end
end
