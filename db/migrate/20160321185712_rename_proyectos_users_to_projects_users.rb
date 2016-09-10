class RenameProyectosUsersToProjectsUsers < ActiveRecord::Migration
  def change
  	rename_table :proyectos_users, :projects_users 
  	change_table :projects_users do |t|
  		t.rename :id_proyecto, :project_id
  		t.rename :id_user, :user_id
  	end
  end
end
