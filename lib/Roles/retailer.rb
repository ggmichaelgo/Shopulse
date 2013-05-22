class Retailer < ActiveRecord::Base
	acts_as_role
	has_many :products
end