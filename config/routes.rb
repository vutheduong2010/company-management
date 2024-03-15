Rails.application.routes.draw do

  get 'home/index'



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
  get '/forgot_password', to: 'password_resets#new'
  post '/forgot_password', to: 'password_resets#create'

  get 'password_resets/:token/edit', to: 'password_resets#edit', as: 'edit_password_reset'
  patch 'password_resets/:token', to: 'password_resets#update'




  resources :companies
  resources :branches
  resources :divisions


  post 'change_account', to: 'home#change_account', as: :change_account
  delete 'logout', to: 'sessions#destroy'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
