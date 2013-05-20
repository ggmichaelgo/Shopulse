class LaunchController < ApplicationController
	def index
		@user_info  = UserInfo.new
		redirect_to :action => 'mypage' if UserInfo.find_by_id(session[:user_info_id])
	end

	def sign_out
		session[:ref] = nil
		session[:user_info_id] = nil
		session[:ref_clicked] = nil
		redirect_to :action => 'index'		
	end

	def submit
		foo = UserInfo.where("email = '#{params[:user_info][:email]}'").first
		if foo == nil
			foo = UserInfo.create(params[:user_info])
			foo.create_launch_info
			foo.launch_info.ref = generate_reference
			foo.launch_info.save
			
			UserMailer.welcome_email(foo).deliver
			MailChimp.add_subcriber foo.email

			ref = session[:ref]
			launch_info = LaunchInfo.where("ref = '#{ref}'").first
			if launch_info != nil
				launch_info.subscriber.push foo.id
				launch_info.save
			end
		end
		session[:user_info_id] = foo.id
		redirect_to :action => 'mypage'
	end

	def mypage
		@user_info = UserInfo.find_by_id(session[:user_info_id])
		redirect_to :action => 'index' if @user_info == nil
	end

	def invite
		ref = params[:id]
		launch_info = LaunchInfo.where("ref = '#{ref}'").first
		user_info = UserInfo.find_by_id(session[:user_info_id])

		session[:ref_clicked] = nil if session[:ref] != nil && ref != session[:ref_clicked]

		if launch_info == nil
			redirect_to :action => 'index'			
		elsif user_info != nil && ref == user_info.launch_info.ref
			redirect_to :action => 'mypage'
		else
			launch_info.ref_clicks+=1 if session[:ref_clicked] == nil
			session[:ref_clicked] = true
			launch_info.save
			session[:ref] = ref
			redirect_to :action => 'index'
		end
	end

	def send_email
		from = UserInfo.find(session[:user_info_id])
		list = get_recipients params[:email][:recipients]
		subject = params[:email][:subject]
		message = params[:email][:message]
		result = UserMailer.launch_invitation_email(from, list, subject, message).deliver
		render :json => 1
	end

	def generate_reference(size = 5)
		charset = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
		(0...size).map{ charset[rand(charset.size)] }.join
	end

	def get_recipients line
		list = []
		line.split(",").each do |x|
			x = x.split('<')[1].delete('>') if x["<"] != nil
			list.push x
		end
		return list.join(",")
	end
end
