class CreateCiudads < ActiveRecord::Migration
  def change
    create_table :ciudads do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
