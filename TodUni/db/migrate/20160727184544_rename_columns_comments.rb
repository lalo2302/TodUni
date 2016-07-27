class RenameColumnsComments < ActiveRecord::Migration
  def change
		rename_column :comments, :commentable_id, :parent_id
		rename_column :comments, :commentable_type, :parent_type
  end
end
