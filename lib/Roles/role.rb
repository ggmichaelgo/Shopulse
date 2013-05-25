module Role
	@classes = []

	def self.load_classes
		if @classes.count < 2
			Admin
			Retailer
			Member
		end
	end

	def self.included(base)
		@classes << base
		base.extend ClassMethods
		# base.define_role_properties_accessors
	end

	def self.find(id)
		load_classes
		role = nil
		@classes.each do |t|
			role = t.find_by_id(id)
			break if role != nil
		end
		return role
	end

	module ClassMethods
		def define_role_properties_accessors
			all_attributes = RoleProperties.content_columns.map(&:name)
			ignored_attributes = ["created_at", "updated_at"]
			attributes_to_delegate = all_attributes - ignored_attributes
			attributes_to_delegate.each do |attrib|				
				class_eval <<-RUBY
					attr_accessible :#{attrib}
				RUBY
			end
		end
	end		
end
