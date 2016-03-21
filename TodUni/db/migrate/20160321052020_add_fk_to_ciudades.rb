class AddFkToCiudades < ActiveRecord::Migration
  def change
  	add_column :ciudades, :id_estado, :integer

  	add_index :ciudades, :id_estado
  end
end
