class RetailersController < ApplicationController
	# skip_before_filter :authenticate

	def index
		redirect_to :action => "update_profile"  if current_user.user_info.role.name == nil
	end

	def get

	end

	def update_profile
		@info = current_user.user_info.role
	end

	def update_profile_post
		role = current_user.user_info.role
		role.update_attributes params[:retailer]
		redirect_to :action => 'update_profile'
	end	
end