class Retailer < ActiveRecord::Base
	acts_as_role
	attr_accessible :name, :phone
	
	#this is to avoid "protected properties" error
	attr_accessible :first_name, :last_name, :address, :city, :province, :country, :postal_code
	
	has_many :products
end