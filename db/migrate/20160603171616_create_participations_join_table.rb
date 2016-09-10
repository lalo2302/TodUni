class CreateParticipationsJoinTable < ActiveRecord::Migration
	def change
		create_table :participations do |t|
			t.belongs_to :user, index: true
			t.belongs_to :project, index: true
			t.integer :role, default: 0

      t.timestamps null: false
		end
	end
end
