class ChangeDateBirthFromDateTimeToDateInUsers < ActiveRecord::Migration
  def change
		change_column :users, :date_birth, :date
  end
end
