
Rails.application.routes.draw do
  # get 'home/index'
  root to: 'home#index'

  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
