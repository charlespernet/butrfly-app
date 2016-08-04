Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {registrations: "registrations"}

  resources :families, only: [:index, :show, :edit, :update]
  resources :aupairs, only: [:index, :show, :edit, :update]

  get 'dashboard', to: 'pages#dashboard'

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :new, :create]
  end
end
