Codemate::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get "signout" => "devise/sessions#destroy"
    get "signin" => "devise/sessions#new"
  end

  get "tags/search"
  get "tag_search/index"
  resources :inquiries

  get "search/index"
  resources :answers
  
  match '/explanation', to:'sessions#explanation', via: 'get'
  match '/about', to:'about#index', via:'get'
  match '/search', to: 'search#index', via: 'get' 
  match '/posts/sort/:type', to: 'posts#sort', via: 'get', as: 'sort_post'
  match 'posts/best_answer', to: 'posts#best_answer', via: 'get'
  
  # resources :users
  resources :tags
  resources :posts

  resources :favorites, only: [:create, :destroy]
  resources :users do
    member do
      get  :favorite, :edit_password
    end
  end

  resources :posts do
    member do
      post :answer

    end
  end
  root  'about#index'
end