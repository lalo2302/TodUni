class AddStatusToComments < ActiveRecord::Migration
  def change
		add_column :comments, :status, :integer
  end
end
