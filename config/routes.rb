CodeHone::Application.routes.draw do
  match "Error/503-error", :to => "error#maintenance_error"

  match "Error/503", :to => "error#maintenance"

  match "Error/500", :to => "error#error"

  match "Error/404", :to => "error#not_found"

  root :to => "home#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end
