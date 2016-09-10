class RenameEvidenciaToEvidencias < ActiveRecord::Migration
  def change
  	rename_table :evidencia, :evidencias
  end
end
