Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: {registrations: "registrations"}

  resources :families, only: [:index, :show, :edit, :update]
  resources :aupairs, only: [:index, :show, :edit, :update]

  get 'dashboard', to: 'pages#dashboard'
end
