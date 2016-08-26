class ChangeDefaultStatusInComments < ActiveRecord::Migration
  def change
		change_column :comments, :status, :integer, default:1
  end
end
