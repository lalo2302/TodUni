class EditStatusFromComments < ActiveRecord::Migration
  def change
		change_column :comments, :status, :integer, :default => 1, :null => false
  end
end
