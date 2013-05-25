class AddPhoneNumberToRetailer < ActiveRecord::Migration
	def change
		add_column :retailers, :phone, :string
	end
end
