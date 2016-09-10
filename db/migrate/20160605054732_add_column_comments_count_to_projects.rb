class AddColumnCommentsCountToProjects < ActiveRecord::Migration
  def change
		add_column :projects, :comments_count, :integer
  end
end
