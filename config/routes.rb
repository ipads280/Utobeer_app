Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
 
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  get 'searches/search'
  

  namespace :admin do
    resources :items, only: [:new, :create, :index, :show,:edit,:update] do
      resources :reviews, only: [:update,:destroy,:edit]
    end
    resources :genres,only: [:index,:create,:update,:destroy,:edit]
    resources :arcs,only: [:index,:create,:update,:destroy,:edit]
    resources :makers,only: [:index,:create,:update,:destroy,:edit]
    resources :users,only: [:index,:show,:update,:destroy,:edit]
  end

  root to:'homes#top'
  get '/search', to: 'searches#search'
  get 'homes/top'
  get 'homes/about',as: 'about'

  resources :users, only: [:edit,:show,:quit,:update] do
    member do
      get :favorites
    end
  end
  # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:create,:new,:update,:destroy,:edit] 
    resource :favorites, only: [:create, :destroy]
  end
  
end
