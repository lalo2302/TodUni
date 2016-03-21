class RenameProyectosHastagsToProjectsHashtags < ActiveRecord::Migration
  def change
  	rename_table :proyectos_hashtags, :projects_hashtags 
  	change_table :projects_hashtags do |t|
  		t.rename :id_proyecto, :project_id
  		t.rename :id_hashtag, :hashtag_id
  	end
  end
end
