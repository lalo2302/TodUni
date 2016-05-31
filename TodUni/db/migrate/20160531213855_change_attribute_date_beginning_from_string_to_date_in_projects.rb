class ChangeAttributeDateBeginningFromStringToDateInProjects < ActiveRecord::Migration
  def change
		change_column :projects, :date_beginning, :date
  end
end
