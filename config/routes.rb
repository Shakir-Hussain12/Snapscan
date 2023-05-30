Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: %i[index show new create]
  get '/home', to: 'home#index'

  unauthenticated :user do
    root "home#index"
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

end
