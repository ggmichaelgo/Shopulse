class Admin < ActiveRecord::Migration
	def change
		execute <<-SQL
			CREATE TABLE admins  as select * from role_properties
		SQL

		execute <<-SQL
			ALTER TABLE io_questions
			ADD PRIMARY KEY (id);
		SQL
		add_column :io_questions, :inputs, :text
		add_column :io_questions, :outputs, :text
	end

	def down
	end
end
