class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :titulo
      t.text :descripcion
      t.string :coordenadas
      t.date :fecha_inicio
      t.date :fecha_final
      t.integer :estatus, default:0

      t.timestamps null: false
    end
  end
end
