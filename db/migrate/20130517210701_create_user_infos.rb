class CreateUserInfos < ActiveRecord::Migration
	def change
		create_table :user_infos do |t|
			t.string :email
			t.references :launch_info
			t.timestamps
		end
	end
end
