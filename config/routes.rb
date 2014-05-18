Wec::Application.routes.draw do
  resources :webinars
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
 
  root to: 'visitors#new'
  
end
