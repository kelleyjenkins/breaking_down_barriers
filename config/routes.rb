Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  resources :users do
    resource :profiles
  end
  resources :profiles

  resources :sessions, only: [:new, :create, :destroy]
  resources :home, only: [:show]


  root "home#index"

  resources :employers do
    resources :jobs
  end

end
