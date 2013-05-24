class Products < ActiveRecord::Migration
	def change
		create_table :products do |t|
			t.integer :retailer_id
			#attr_accessible :price, :description, :size, :name
			t.float :price
			t.text :description
			t.string :size
			t.string :name

			t.timestamps
		end
	end
end
