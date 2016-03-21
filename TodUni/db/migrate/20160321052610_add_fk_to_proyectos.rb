class AddFkToProyectos < ActiveRecord::Migration
  def change
  	add_column :proyectos, :id_ciudad, :integer

  	add_index :proyectos, :id_ciudad
  end
end
