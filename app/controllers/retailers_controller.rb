class RetailersController < ApplicationController
	# skip_before_filter :authenticate

	def index
		render :json => current_user.user_info
	end

	def get

	end

	def update_profile

	end
end