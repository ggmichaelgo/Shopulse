class ApplicationController < ActionController::Base
	#protect_from_forgery
	before_filter :authenticate

	def authenticate
		redirect_to new_user_session_path unless user_signed_in? 
	end

	private 
	def after_sign_out_path_for(resource_or_scope)
		root_path
	end
end
