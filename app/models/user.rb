
class User < ActiveRecord::Base
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	attr_accessible :email, :password, :password_confirmation, :remember_me
	has_one :user_info
	has_and_belongs_to_many :roles
	validates_confirmation_of :password

	def build_user_info
		super
		self.user_info.email = self.email
		self.user_info.save
	end

	def role?(role)
		return !!self.roles.find_by_name(role.to_s.camelize)
	end
end
