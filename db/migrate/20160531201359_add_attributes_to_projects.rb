class AddAttributesToProjects < ActiveRecord::Migration
  def change
		rename_column :projects, :due_date, :date_end
		add_column :projects, :date_beginning, :string
		add_column :projects, :budget, :string
  end
end
