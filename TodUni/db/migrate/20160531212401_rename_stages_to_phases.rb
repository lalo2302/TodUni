class RenameStagesToPhases < ActiveRecord::Migration
  def change
		rename_table :stages, :phases
		change_table :phases do |t|
			t.rename :stage_num, :phase_number
			t.rename :due_date, :date_end
			t.date :date_beginning
		end
  end
end
