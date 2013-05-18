class RegistrationsController < Devise::RegistrationsController
	def new		
		super
	end

	def create
		super
		redirect_to :controller => "members", :action => "update_taste"
	end
end