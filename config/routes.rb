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
  
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show,:edit,:update]
    resources :genres,only: [:index,:create,:update,:destroy,:edit]
    resources :arcs,only: [:index,:create,:update,:destroy,:edit]
    resources :makers,only: [:index,:create,:update,:destroy,:edit]
  end
  
  root to:'homes#top'
  
  get 'homes/top'
  get 'homes/about',as: 'about'
  
  resources :items, only: [:index, :show]
end
