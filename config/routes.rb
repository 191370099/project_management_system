Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :projects do
    resources :tasks, shallow: true
  end
end
