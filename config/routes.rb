Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {registrations: "registrations"}

  resources :families, only: [:index, :edit, :update]
  resources :aupairs, only: [:edit, :update]

  get 'dashboard', to: 'pages#dashboard'
end
