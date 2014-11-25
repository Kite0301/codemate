Codemate::Application.routes.draw do
  get "inquiry/index"
  get "inquiry/confirm"
  get "inquiry/thanks"
  get "inquiry_controller/index"
  get "inquiry_controller/confirm"
  get "inquiry_controller/thanks"
  get "search/index"
  resources :answers

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root  'about#index'
  match '/explanation', to:'sessions#explanation', via: 'get'
  match '/about', to:'about#index', via:'get'
  match '/signin', to:'sessions#new', via:'get'
  match '/signout', to:'sessions#destroy', via:'get'
  match '/search', to: 'search#index', via: 'get' 
  
  resources :users
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :users do
    member do
      get  :favorite
    end
  end

  resources :posts do
    member do
      post :answer

    end
  end

  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
end