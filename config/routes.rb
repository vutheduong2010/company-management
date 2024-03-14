Rails.application.routes.draw do
  get 'branches/index'
  get 'branches/show'
  get 'branches/new'
  get 'branches/create'
  get 'branches/edit'
  get 'branches/update'
  get 'branches/destroy'
  get 'home/index'

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






  resources :companies
  resources :branches
  resources :divisions

end
