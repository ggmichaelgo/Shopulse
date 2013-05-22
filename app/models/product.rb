class Product < ActiveRecord::Base
	attr_accessible :price, :description, :size, :name
	belongs_to :retailer
end