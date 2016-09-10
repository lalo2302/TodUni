class ChangePhaseNumberOfPhase < ActiveRecord::Migration
  def change
    rename_column :phases, :phase_number, :type
  end
end
