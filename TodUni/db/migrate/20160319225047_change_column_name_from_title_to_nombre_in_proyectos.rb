class ChangeColumnNameFromTitleToNombreInProyectos < ActiveRecord::Migration
  def change
  	rename_column :proyectos, :titulo, :nombre
  end
end
