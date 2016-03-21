class RenameEtapasToStages < ActiveRecord::Migration
  def change
  	rename_table :etapas, :stages 
    change_table :stages do |t|
  		t.rename :numero_etapa, :stage_num
  		t.rename :descripcion, :description
  		t.rename :fecha_final, :due_date
  		t.rename :estatus, :status
  		t.rename :horas, :hours
  		t.rename :id_proyecto, :project_id
  	end

  end
end
