class AddFkToComentarios < ActiveRecord::Migration
  def change
  	add_column :comentarios, :id_proyecto, :integer
  	add_column :comentarios, :id_user, :integer

  	add_index :comentarios, :id_proyecto
  	add_index :comentarios, :id_user
  end
end
