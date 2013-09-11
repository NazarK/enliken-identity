Identity::Application.routes.draw do
  
  root :to => "home#home"
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  
  devise_for :users
  match ':controller(/:action(/:id))(.:format)'
end
