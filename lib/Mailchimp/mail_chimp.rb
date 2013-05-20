class MailChimp
	def self.add_subcriber email
		api = Mailchimp::API.new("c745521193c8299bb4f6b24c129dec92-us4")
		# listSubscribe(string apikey, string id, string email_address, array merge_vars, 
		# 	string email_type, bool double_optin, bool update_existing, bool replace_interests, bool send_welcome)
		#59ba375799 Launch Page Subscriber
		begin
			api.list_subscribe(
				id: "59ba375799", 
				email_address: email,
				double_optin: false,
				send_welcome: false
			)
		rescue Exception => e
			puts e
		end
	end
end

