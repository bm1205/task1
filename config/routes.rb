Rails.application.routes.draw do
  get 'sessions/new'
  get 'tags/new'
  get 'users/new'
  get 'pages/index'
  root 'pages#index'
  get 'pages/help'
  resources :users
  get 'pages/link'
   get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
