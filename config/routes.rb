Rails.application.routes.draw do
  get 'company_managements/new'
  get 'company_managements/create'
  get 'password_resets/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  #sign up
  root to: "home#index"
  get "sign_up", to: "user#new"
  post "sign_up", to: "user#create"

  #log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #forgot password
  get '/forgot_password', to: 'password_resets#new'
  post '/forgot_password', to: 'password_resets#create'







  # Defines the root path route ("/")
  # root "posts#index"
end
