Rails.application.routes.draw do
  # sessions
  resource :session, only: :create
  get "login", to: "sessions#new", as: "login"
  delete "logout", to: "sessions#destroy", as: "logout"

  # change password
  get "change_password", to: "passwords#change_password", as: "change_password"
  patch "update_password", to: "passwords#update_password", as: "update_password"

  # users
  resources :users, only: :create
  get "sign_up", to: "users#new", as: "sign_up"
  get "profile", to: "users#show", as: "profile"

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#home"
end
