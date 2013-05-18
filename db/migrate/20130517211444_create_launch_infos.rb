class CreateLaunchInfos < ActiveRecord::Migration
	def change
		create_table :launch_infos do |t|			
			t.references :viewers
			t.timestamps
		end
	end
end
