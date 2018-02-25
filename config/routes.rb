Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  resources :sessions, only: [:new, :create, :destroy]
  resource :home, only: [:show]

  root "home#index"

  resources :jobs
  resources :employers

  namespace :employers do
    # get "/dashboard", to: "employers#show"
    resources :jobs
  end

end
