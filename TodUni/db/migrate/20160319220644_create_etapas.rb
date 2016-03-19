class CreateEtapas < ActiveRecord::Migration
  def change
    create_table :etapas do |t|
      t.integer :numero_etapa
      t.text :descripcion
      t.date :fecha_final
      t.integer :estatus, default:0
      t.integer :horas

      t.timestamps null: false
    end
  end
end
