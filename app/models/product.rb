class Product < ActiveRecord::Base
	attr_accessible :price, :description, :size, :name, :gender, :brand, :material, :sale_price, :images
	belongs_to :retailer
end
