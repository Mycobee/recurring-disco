Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # sessions routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  # users routes
  get '/register', to: 'users#new', as: 'registration'
  get '/profile/:id', to: 'users#show', as: 'profile'
  resources :users, only: [:create]

  # articles routes
  resources :articles, only: [:index]
end
