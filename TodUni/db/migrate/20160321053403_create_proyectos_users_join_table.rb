class CreateProyectosUsersJoinTable < ActiveRecord::Migration
  def change
  	create_table :proyectos_users, id: false do |t|
  		t.integer :id_proyecto
  		t.integer :id_user
  	end

  	add_index :proyectos_users, :id_proyecto
  	add_index :proyectos_users, :id_user
  end
end
