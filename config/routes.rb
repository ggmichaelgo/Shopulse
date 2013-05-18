Shopulse::Application.routes.draw do
	devise_for :users

	root :to => 'launch#index'

	match 'invite/:id' => 'launch#invite'
	match ':controller(/:action(/:id))(.:format)'
end
