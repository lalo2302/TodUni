class DropTagsTable < ActiveRecord::Migration
  def change
  	drop_table :hashtags
  	drop_table :projects_hashtags
  end
end
