Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  resources :sessions, only: [:new, :create, :destroy]
  resource :home, only: [:show]

  root "home#index"

  resources :jobs, only: [:index]

  resources :employers do
    resources :jobs
  end

  # namespace :employers do
  #   resources :jobs, only: [:new, :create, :edit, :update, :destroy]
  # end

end
