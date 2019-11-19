Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # sessions routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout

  # users routes
  get '/register', to: 'users#new', as: 'registration'
  resources :users, only: [:create]

  # articles routes
  resources :articles, only: [:index, :show] do
    resources :comments, only: [:new, :create]
  end

  # recurly routes
  get '/recurly/new', to: 'recurly#new', as: 'recurly'
end
