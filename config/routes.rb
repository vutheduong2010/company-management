Rails.application.routes.draw do
  get 'home/index'
  get 'companies/index'
  get 'companies/show'
  get 'companies/new'
  get 'companies/create'
  get 'companies/edit'
  get 'companies/update'
  get 'companies/destroy'
  get 'password_resets/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  get "sign_up", to: "user#new"
  post "sign_up", to: "user#create"

  #log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'


  #forgot password
  get 'forgot_password', to: 'password_resets#new', as: 'forgot_password'




  get 'companies', to: 'companies#index'

  get '/company/:id', to: 'companies#show', as: 'company'
  delete '/company/:id', to: 'companies#destroy'





  # Defines the root path route ("/")
  # root "posts#index"
end
