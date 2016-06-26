Rails.application.routes.draw do
  resources :pulications
  resources :users

  root 'home#index'  
end
