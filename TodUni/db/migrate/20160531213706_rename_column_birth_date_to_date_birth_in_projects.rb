class RenameColumnBirthDateToDateBirthInProjects < ActiveRecord::Migration
  def change
		rename_column :users, :birth_date, :date_birth
		add_column :users, :date_end, :date
  end
end
