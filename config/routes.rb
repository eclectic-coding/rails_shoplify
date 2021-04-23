Rails.application.routes.draw do
  resources :products

  post "checkout/create", to: "checkout#create"

  root "products#index"
end
