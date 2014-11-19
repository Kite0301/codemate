Codemate::Application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  match '/signin', to:'sessions#new', via:'get'
  match '/signout', to:'sessions#destroy', via:'get'
  resources :users
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
end