class RenameEvidenciasToEvidences < ActiveRecord::Migration
  def change
  	rename_table :evidencias, :evidences 
    change_table :evidences do |t|
  		t.rename :titulo, :title
  		t.rename :descripcion, :description
  		t.rename :contenido, :content
  		t.rename :estatus, :status
  		t.rename :id_etapa, :stage_id
  		t.rename :id_user, :user_id
  	end
  end
end
