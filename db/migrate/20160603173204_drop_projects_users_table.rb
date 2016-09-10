class DropProjectsUsersTable < ActiveRecord::Migration
  def change
		drop_table :projects_users
  end
end
