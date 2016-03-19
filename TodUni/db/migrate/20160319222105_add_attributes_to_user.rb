class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :fecha_nacimiento, :datetime
    add_column :users, :nombre, :string
    add_column :users, :estatus, :integer
  end
end
