class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def complete?
    @complete = true
    if self.name.blank? || self.birth_date.blank?
      @complete = false
    end
    @complete
  end
end
