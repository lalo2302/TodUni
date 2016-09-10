class RenameCiudadsToCiudades < ActiveRecord::Migration
  def change
  	rename_table :ciudads, :ciudades
  end
end
