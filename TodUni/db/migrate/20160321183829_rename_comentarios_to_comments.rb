class RenameComentariosToComments < ActiveRecord::Migration
  def change
  	rename_table :comentarios, :comments 
  	change_table :comments do |t|
  		t.rename :texto, :text
  		t.rename :id_proyecto, :project_id
  		t.rename :id_user, :user_id
  	end
  end
end
