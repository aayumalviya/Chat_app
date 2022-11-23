Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  get 'users/index'

  root to: 'users#index'
  # resources :users
  resources :users do 
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
