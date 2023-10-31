Rails.application.routes.draw do
  root "projects#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :projects
  resources :tasks
end
