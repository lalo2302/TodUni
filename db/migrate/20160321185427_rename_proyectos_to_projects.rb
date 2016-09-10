class RenameProyectosToProjects < ActiveRecord::Migration
  def change
  	rename_table :proyectos, :projects 
    change_table :projects do |t|
  		t.rename :nombre, :name
  		t.rename :descripcion, :description
  		t.rename :coordenadas, :coordinates
  		t.rename :fecha_final, :due_date
  		t.rename :estatus, :status
  		t.rename :id_ciudad, :city_id
  	end
  end
end
