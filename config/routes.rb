Rails.application.routes.draw do
  devise_for :users
  root "event#index"
  resources :event
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
