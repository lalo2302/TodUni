class Comment < ActiveRecord::Base
	enum status: [:deleted, :active, :edited]
	belongs_to :user
	belongs_to :parent, polymorphic: true, counter_cache: true
	has_many :comments, as: :parent, dependent: :delete_all
end
