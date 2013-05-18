class Retailer < ActiveRecord::Base
  attr_accessible :address, :city, :country, :name, :phone, :province
end
