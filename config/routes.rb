Rails.application.routes.draw do

  get 'user_profiles/new'

  get 'user_profiles/create'

  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # match '/logout', to: 'sessions#destroy', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get 'dashboard', to: 'dashboard#index', as: :dashboard_index_path
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth',
                                    sessions: 'users/sessions' }
end
