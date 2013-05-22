class RoleProperties < ActiveRecord::Migration
  def up
  	# attr_accessible :first_name, :last_name, :address, :city, :province, :country, :postal_code
  end

  def change
		create_table :role_properties do |t|
			t.string :first_name
			t.string :last_name
			t.string :address
			t.string :city
			t.string :province
			t.string :country
			t.string :postal_code
			t.timestamps
		end
	end

  def down
  end
end
