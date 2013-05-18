class UserInfo < ActiveRecord::Base
	attr_accessible :email
	has_one :launch_info

	def build_launch_info
		super
		self.launch_info = LaunchInfo.create
	end
end
