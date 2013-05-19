Shopulse::Application.routes.draw do
	resources :roles

	root :to => 'launch#index'

	devise_for :users, :controllers => {:registrations => 'registrations'}  do
		get "register", :to => "registrations#select"
		root :to => 'registrations#select'
	end
	match 'invite/:id' => 'launch#invite'
	match 'register' => 'registrations#select'
	# match 'register' => 'launch#index'
	match ':controller(/:action(/:id))(.:format)'	
end
