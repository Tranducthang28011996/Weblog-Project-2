Rails.application.routes.draw do
  devise_for :users, omniauth_callbacks: "omniauth_callbacks"
  get "/pages/:page", to: "pages#show"
  root "pages#show", page: "home"
  resources :users, only: %i[show index update]
  post "follow/:id", to: "relationships#create", as: "follow"
  delete "unfollow/:id", to: "relationships#destroy", as: "unfollow"
end
