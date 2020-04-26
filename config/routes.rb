Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses, only: [:index, :show]

  root 'courses#index'

  namespace :admin do
    root 'courses#index'
    resources :courses
  end
end
