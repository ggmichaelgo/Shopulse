class UserInfo < ActiveRecord::Base
	attr_accessible :email
	has_one :demo_info

	def build_demo_info
		super
	end
end
