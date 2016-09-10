class CreateProyectosHashtagsJoinTable < ActiveRecord::Migration
  def change
  	create_table :proyectos_hashtags, id: false do |t|
  		t.integer :id_proyecto
  		t.integer :id_hashtag
  	end

  	add_index :proyectos_hashtags, :id_proyecto
  	add_index :proyectos_hashtags, :id_hashtag
  end
end
