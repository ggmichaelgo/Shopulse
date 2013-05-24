class Retailer < ActiveRecord::Base
	acts_as_role
	attr_accessible :name
	has_many :products
end