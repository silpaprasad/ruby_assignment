Rails.application.routes.draw do
  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  resources :sessions, only: [ :new, :create, :destroy]
  resources :profiles
  resources :users
  resources :hobbies
  resources :site_details
  # match '/scrape', to: 'vehicles#scrape', via: :post, on: :collection

  root 'site_details#index'
  get 'sign-up' => 'users#sign_up'

  # get "/sign_up"=> "sessions#new", as: "signup"
  get "/login"=>"sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
end
