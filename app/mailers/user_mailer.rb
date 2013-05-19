class UserMailer < ActionMailer::Base
	default from: "ggmichaelgo@gmail.com"

	def launch_invitation_email user, recipients, subject, message
		@ref = user.launch_info.ref
		@message = message
		@user = user

		mail(:to => recipients, :subject => "Shopulse: "+subject)
	end

	def welcome_email user
		@user = user
	end
end
