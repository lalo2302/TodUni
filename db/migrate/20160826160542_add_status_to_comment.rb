class AddStatusToComment < ActiveRecord::Migration
  def change
		add_column :comments, :status, :integer, default:0
  end
end
