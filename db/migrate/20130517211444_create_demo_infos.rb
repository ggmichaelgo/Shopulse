class CreateDemoInfos < ActiveRecord::Migration
	def change
		create_table :demo_infos do |t|			
			t.references :viewers
			t.timestamps
		end
	end
end
