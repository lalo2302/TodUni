class ChangeParentTypeComments < ActiveRecord::Migration
  def change
		change_column :comments, :parent_type, :string
  end
end
