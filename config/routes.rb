Rails.application.routes.draw do
  resources :twitters
  resources :user_tweets
  resources :tweet_msgs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
