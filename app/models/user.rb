class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	attr_accessible :email, :password, :password_confirmation, :remember_me

	has_one :user_info

	def build_user_info
		super
		self.user_info.email = self.email
		self.user_info.save
	end
end
