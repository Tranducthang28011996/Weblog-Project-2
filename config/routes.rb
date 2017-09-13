Rails.application.routes.draw do
  devise_for :users
  get "/pages/:page", to: "pages#show"
  root "pages#show", page: "home"

  resources :users, only: %i[show index]
end
