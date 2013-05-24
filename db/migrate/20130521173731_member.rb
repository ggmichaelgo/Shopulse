class Member < ActiveRecord::Migration
	def change
		execute <<-SQL
		CREATE TABLE members  as select * from role_properties
		SQL

		execute <<-SQL
		ALTER TABLE members
		ADD PRIMARY KEY (id);
		SQL
		# add_column :members, :inputs, :text
		# add_column :members, :outputs, :text
	end

	def down
	end
end
