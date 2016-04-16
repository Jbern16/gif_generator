Rails.application.routes.draw do
  resources :gifs, only: [ :index, :show ]

  resources :categories, param: :name,  only: [ :show, :index ]

  resources :users, only: [ :new, :create, :show ]

  namespace :admin do
    resources :gifs, only: [ :new ]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"


end
