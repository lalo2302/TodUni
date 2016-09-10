class RemoveColumnDateEndFromUsers < ActiveRecord::Migration
  def change
		remove_column :users, :date_end
  end
end
