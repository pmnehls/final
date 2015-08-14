Rails.application.routes.draw do

  root 'restaurants#index'

  get '/logout' => 'sessions#destroy'
  get '/profile' => 'users#show'
  get '/wall' => 'lists#show'
  get '/initial' => 'sessions#create'
  post '/yelp' => 'restaurants#search'

  resources :restaurants
  resources :users
  resources :reviews
  resources :sessions
  resources :lists

  # get '/restaurants' => 'restaurants#index'
  # get '/restaurants/new' => 'restaurants#new'
  # post '/restaurants' => 'restaurants#create'
  # get '/restaurants/:id' => 'restaurants#show'
  # get '/restaurants/:id/edit' => 'restaurants#edit'
  # patch '/restaurants/:id' => 'restaurants#update'
  # delete '/restaurants/:id' => 'restaurants#destroy'
end
