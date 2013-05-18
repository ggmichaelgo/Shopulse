class UserInfo < ActiveRecord::Base
	attr_accessible :email
	has_one :launch_info

	def create_launch_info
		self.launch_info = LaunchInfo.create
		self.launch_info.subscriber = []
		self.launch_info.ref_clicks = 0
		self.launch_info.save
		self.save
	end
end
