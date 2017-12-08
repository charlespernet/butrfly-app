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

  get 'aupair_commitment', to: 'pages#aupair_commitment'
  get 'family_commitment', to: 'pages#family_commitment'

  get 'aupair_conditions', to: 'pages#aupair_conditions'
  get 'family_conditions', to: 'pages#family_conditions'

  # get 'plans', to: 'pages#plans'

  resources :conversations, only: [:create] do
    resources :messages, only: [:index, :create]
  end


  mount Attachinary::Engine => "/attachinary"
end
