class ChangeLocaleFromStringToEnumInUsers < ActiveRecord::Migration
  def change
		change_column :users, :locale, :integer
  end
end
