class ChangeColumnNamesInEvidences < ActiveRecord::Migration
  def change
		rename_column :evidences, :stage_id, :phase_id	
  end
end
