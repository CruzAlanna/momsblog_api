Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :comments

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'

  #later change to namespace versioning (Purpose is to have a new class become v2, and so on)
end
