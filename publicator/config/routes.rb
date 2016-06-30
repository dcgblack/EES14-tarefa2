Rails.application.routes.draw do
  resources :publications
  resources :users

  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]


  root 'home#index'  
end
