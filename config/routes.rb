Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :sessions, only: %i[create destroy]
    resources :registrations, only: %i[create]

    namespace :v1 do
      resources :activities, only: %i[index]
      resources :schedules, only: %i[index create destroy]
      resources :user_schedules, only: %i[index]
    end
  end
end
