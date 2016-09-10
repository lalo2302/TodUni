class RenameTableCiudadesToCities < ActiveRecord::Migration
  def change
  	rename_table :ciudades, :cities 
  	change_table :cities do |t|
  		t.rename :nombre, :name
  		t.rename :id_estado, :state_id
  	end
  end
end
