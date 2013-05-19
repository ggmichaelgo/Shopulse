class MailChimp
	def self.add_subcriber email
		gb = Gibbon.new("c745521193c8299bb4f6b24c129dec92-us4")
		#59ba375799 Launch Page Subscriber
		begin
			gb.list_subscribe({
				:id => "59ba375799", 
				:email_address => email,
				:merge_vars => {
					:FNAME => "N/A", 
					:LNAME => "N/A"
				}
				})
		rescue Exception => e
			puts e
		end
	end
end