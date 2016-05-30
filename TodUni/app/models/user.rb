class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects
  has_many :comments
  has_many :evidences

	def self.types
		%w(Mentor NormalUser)
	end

	scope :mentors, -> { where(type: 'Mentor') }  
	scope :normal_users, -> { where(type: 'NormalUser') }


  def complete?
    @complete = true
    if self.name.blank? || self.birth_date.blank?
      @complete = false
    end
    @complete
  end
end
