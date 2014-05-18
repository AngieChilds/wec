Wec::Application.routes.draw do
  resources :microposts
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
     member do
     patch 'more'
   end
  end
  resources :webinars
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
 
  root to: 'visitors#new'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match 'toggle', to: 'users#toggle',            via: 'patch' 
end
