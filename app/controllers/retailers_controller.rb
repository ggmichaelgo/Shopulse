class RetailersController < ApplicationController
	# skip_before_filter :authenticate

	def index
		redirect_to :action => "update_profile" current_user.user_info.role.first_name == nil
	end

	def get

	end

	def update_profile
		@info = current_user.user_info.role
	end
end