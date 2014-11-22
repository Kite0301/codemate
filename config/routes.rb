Codemate::Application.routes.draw do
  resources :answers

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

  resources :posts do
    member do
      # /tweets/:id/reply
      post :answer
    end
  end
end