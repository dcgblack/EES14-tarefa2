Rails.application.routes.draw do
  resources :publications do 
    resources :authors, only: [:create, :update], module: :publications
  end
  resources :users

  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]


  root 'home#index'  
end
