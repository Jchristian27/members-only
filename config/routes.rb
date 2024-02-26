Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, path: '', path_names: { 
    sign_in: 'login', 
    sign_out: 'logout', 
    password: 'reset', 
    confirmation: 'confirm', 
    unlock: 'unlock', 
    registration: 'register', 
    sign_up: 'signup' 
  }
  resources :posts
  
  get "up" => "rails/health#show", as: :rails_health_check
end
