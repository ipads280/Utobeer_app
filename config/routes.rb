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
  
  root to:'homes#top'
  
  get 'homes/top'
  get 'homes/about',as: 'about'
end
