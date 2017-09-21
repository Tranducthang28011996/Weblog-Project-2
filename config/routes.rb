Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  get "/pages/:page", to: "pages#show"
  root "pages#home"
  resources :users, only: %i[show index update]
  post "follow/:id", to: "relationships#create", as: "follow"
  delete "unfollow/:id", to: "relationships#destroy", as: "unfollow"

  resources :posts
end
