Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'pages#home'
  devise_for :users, controllers: {registrations: "registrations"}

  resources :families, only: [:index, :show, :edit, :update]
  resources :aupairs, only: [:index, :show, :edit, :update]



  resources :payments, only: [:new, :create]

  get 'dashboard', to: 'pages#dashboard'
  get 'procedure', to: 'pages#procedure'
  get 'about', to: 'pages#about'
  get 'congratulations', to: 'pages#congratulations'
  # get 'plans', to: 'pages#plans'

  resources :conversations, only: [:create] do
    resources :messages, only: [:index, :create]
  end


  mount Attachinary::Engine => "/attachinary"
end
