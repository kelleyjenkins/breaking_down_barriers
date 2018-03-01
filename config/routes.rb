Rails.application.routes.draw do
  root "home#index"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  resources :mentorships

  resources :users do
    resource :profiles
  end

  resources :profiles, only: [:new, :create, :edit, :update]

  resources :sessions, only: [:new, :create, :destroy]

  resources :home, only: [:show]

  resources :jobs, only: [:index, :show]

  resources :employers do
    resources :jobs, only: [:edit, :new, :create, :update, :destroy]
  end

  namespace :api do
    namespace :v1 do
      get '/jobs', to: 'jobs#index'
    end
  end
end
