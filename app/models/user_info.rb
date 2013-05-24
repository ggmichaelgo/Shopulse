class UserInfo < ActiveRecord::Base
	attr_accessible :email, :role_id
	has_one :launch_info

	def build_launch_info
		self.launch_info = LaunchInfo.create
		self.launch_info.subscriber = []
		self.launch_info.ref_clicks = 0
		self.launch_info.save
		self.save
	end

	def role
		Role.find(role_id)
	end

	def role= role
		self.role_id = role.id
	end	
end
