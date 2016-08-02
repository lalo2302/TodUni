class Comment < ActiveRecord::Base

	belongs_to :user
	belongs_to :parent, polymorphic: true, counter_cache: true
	has_many :comments, as: :parent, dependent: :delete_all
end
