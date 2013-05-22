class Admin < ActiveRecord::Migration
	def change
		execute <<-SQL
			CREATE TABLE admins  as select * from role_properties
		SQL

		execute <<-SQL
			ALTER TABLE admins
			ADD PRIMARY KEY (id);
		SQL
		# add_column :admins, :inputs, :text
		# add_column :admins, :outputs, :text
	end

	def down
	end
end
