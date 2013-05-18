class LaunchInfo < ActiveRecord::Base
	attr_accessible :ref, :ref_clicks
	serialize :subscriber
	belongs_to :user_info
end