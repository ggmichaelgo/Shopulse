class Retailer < ActiveRecord::Migration
	def change
		#inherit properties from Retailer
		execute <<-SQL
			CREATE TABLE retailers  as select * from role_properties
		SQL

		# execute <<-SQL
		# 	ALTER TABLE retailers DROP id;
		# SQL
		# execute <<-SQL
		# 	ALTER TABLE retailers ADD id int(10) PRIMARY KEY AUTO_INCREMENT;
		# SQL
		
		add_column :retailers, :name, :string
		# add_column :retailers, :outputs, :text
	end

	def down
		drop_table :retailers
	end
end
