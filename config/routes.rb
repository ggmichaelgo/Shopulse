Shopulse::Application.routes.draw do
  devise_for :users

  root :to => 'demo#index'
  match ':controller(/:action(/:id))(.:format)'
end
 