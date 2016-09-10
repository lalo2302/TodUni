class RenameEstadosToStates < ActiveRecord::Migration
  def change
  	rename_table :estados, :states 
  	change_table :states do |t|
  		t.rename :nombre, :name
  	end
  end
end
