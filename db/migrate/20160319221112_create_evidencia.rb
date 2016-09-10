class CreateEvidencia < ActiveRecord::Migration
  def change
    create_table :evidencia do |t|
      t.string :titulo
      t.text :descripcion
      t.string :contenido
      t.integer :estatus, default:0

      t.timestamps null: false
    end
  end
end
