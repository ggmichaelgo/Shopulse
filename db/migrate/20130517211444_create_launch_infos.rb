class CreateLaunchInfos < ActiveRecord::Migration
	def change
		create_table :launch_infos do |t|			
			t.integer :user_info_id
			t.integer :ref_clicks
			t.string :subscriber
			t.string :ref
			t.timestamps
		end
	end
end
