class LaunchController < ApplicationController
	def index
		@user_info  = UserInfo.new
		redirect_to :action => 'mypage' if UserInfo.find_by_id(session[:user_info_id])
	end

	def submit
		user_info  = UserInfo.new(params[:user_info])
		foo = UserInfo.where('email = "%{@user_info.email}"').first
		if foo == nil
			foo = UserInfo.create(params[:user_info])			
		end
		session[:user_info_id] = foo.id
		redirect_to :action => 'mypage'
	end

	def mypage
		@user_info = UserInfo.find_by_id(session[:user_info_id])
		render :json => @user_info
	end
end
