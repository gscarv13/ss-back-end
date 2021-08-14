Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[create]
  resources :registrations, only: %i[create]
  root to: 'static#home'
end
