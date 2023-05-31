Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: %i[index show new create destroy] do
    resources :games, only: %i[index show new create destroy]
  end

  get '/home', to: 'home#index'
  
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  root 'home#index'
    
end
