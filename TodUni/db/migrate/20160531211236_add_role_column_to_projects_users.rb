class AddRoleColumnToProjectsUsers < ActiveRecord::Migration
  def change
		add_column :projects_users, :role, :integer, default:0
  end
end
