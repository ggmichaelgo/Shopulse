Shopulse::Application.routes.draw do
	resources :roles

	root :to => 'launch#index'
	# root :to => 'retailers#index'

	devise_for :users, :controllers => {:sessions => 'sessions', :registrations => 'registrations'} do
		get "register", :to => "registrations#select_role"
		root :to => 'registrations#select_role'
	end
	match 'invite/:id' => 'launch#invite'
	match 'launch/mypage' => 'launch#send_email', :via => :post

	# match 'register' => 'launch#index'
	match ':controller(/:action(/:id))(.:format)'	
end
