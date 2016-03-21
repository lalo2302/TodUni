class RenameUsersColumns < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.rename :fecha_nacimiento, :birth_date
  		t.rename :nombre, :name
  		t.rename :estatus, :status
  	end
  end
end