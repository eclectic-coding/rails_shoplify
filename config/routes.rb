Rails.application.routes.draw do
  devise_for :users
  resources :products

  post "checkout/create", to: "checkout#create"
  resources :webhooks, only: [:create]

  root "products#index"
end
