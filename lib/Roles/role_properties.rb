class RoleProperty < ActiveRecord::Base
	include Role
	belongs_to :Role, :polymorphic => true, :dependent => :destroy
	attr_accessible :first_name, :last_name, :address, :city, :province, :country, :postal_code
end