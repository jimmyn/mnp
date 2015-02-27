Rails.application.routes.draw do
  mount_activeadmin_settings()
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/index'
  get 'about' => 'pages#about'
  get 'delivery' => 'pages#delivery'
  resource :contacts, only: :create
  resources :products, only: [:index, :show]
  resources :articles, only: [:index, :show]
  resources :reviews, only: :index
  resources :contacts, only: :index
  resources :orders, except: :index do
    get 'success', on: :member
  end
  root to: 'pages#index'
end
