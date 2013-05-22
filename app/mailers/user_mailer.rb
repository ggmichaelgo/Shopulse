class UserMailer < ActionMailer::Base
	default from: "\"Shopulse\" <hello@Shopulse.com>"

	def launch_invitation_email user, recipient, subject, message
		@ref = user.launch_info.ref
		@message = message
		@user = user
		mail(:to => recipient, :subject => subject)
	end

	def welcome_email user
		@user = user
		mail(:to => user.email, :subject => "Welcome To Shopulse")
	end
end
