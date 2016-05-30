class AddMentorToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :mentor_id, :integer
  end
end
