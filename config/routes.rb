Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :sessions, only: %i[create destroy]
    resources :registrations, only: %i[create]
    get :logged_in, to: 'sessions#logged_in'
  end
end
