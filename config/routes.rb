Identity::Application.routes.draw do
  
  root :to => "home#home"
  
  devise_for :users
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  match ':controller(/:action(/:id))(.:format)'
end
