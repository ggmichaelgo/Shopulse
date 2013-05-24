class RegistrationsController < Devise::RegistrationsController
	skip_before_filter :authenticate
	def new
		if params[:id] != nil
			super
		else
			redirect_to :action => "select_role"
		end
	end

	def select_role

	end

	def create
		super
		if current_user != nil
			current_user.build_user_info
			if params[:id] == "retailer"				
				current_user.user_info.role = Retailer.create
			else
				current_user.user_info.role = Member.create
			end
			current_user.user_info.save
			current_user.save
		end
	end
end