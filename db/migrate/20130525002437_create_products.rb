class CreateProducts < ActiveRecord::Migration
	def change
		create_table :products do |t|
			t.integer :retailer_id
			t.float :price
			t.float :sale_price
			t.string :name
			t.string :brand
			t.string :gender
			t.text :description
			t.string :material
			t.text :size

			t.text :images
			t.timestamps
		end
	end
end
