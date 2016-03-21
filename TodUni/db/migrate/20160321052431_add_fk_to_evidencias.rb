class AddFkToEvidencias < ActiveRecord::Migration
  def change
  	add_column :evidencias, :id_etapa, :integer
  	add_column :evidencias, :id_user, :integer

  	add_index :evidencias, :id_etapa
  	add_index :evidencias, :id_user
  end
end
