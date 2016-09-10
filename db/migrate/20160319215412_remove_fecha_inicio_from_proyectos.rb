class RemoveFechaInicioFromProyectos < ActiveRecord::Migration
  def change
    remove_column :proyectos, :fecha_inicio, :date
  end
end
