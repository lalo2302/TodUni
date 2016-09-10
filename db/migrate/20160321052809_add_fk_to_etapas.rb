class AddFkToEtapas < ActiveRecord::Migration
  def change
  	add_column :etapas, :id_proyecto, :integer

  	add_index :etapas, :id_proyecto
  end
end
