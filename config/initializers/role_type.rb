class ActiveRecord::Base
	def self.acts_as_role
		include Role
	end
end
