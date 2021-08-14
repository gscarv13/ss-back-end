Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: %i[create delete]
  resources :registrations, only: %i[create]
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end
