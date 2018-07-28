Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  get 'cards/show'

  resources :audit_logs, except: [:new, :edit, :destroy] do
    get :confirm
  end

  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users
    resources :employees
    resources :managers

    root to: "users#index"
  end

  resources :posts do
    member do
      get :approve
      get :submit
    end
  end

  resources :cards
  resources :skills
  resources :users, only: [:index]
  get 'users/follow/:id', to: 'users#follow', as: 'follow_user'
  root 'static#homepage'
end
