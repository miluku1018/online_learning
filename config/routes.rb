Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses, only: [:index, :show]

  root 'courses#index'

  mount ApiRoot => ApiRoot::PREFIX
  mount GrapeSwaggerRails::Engine => '/apidoc'

  resource :cart, only: [:destroy, :show] do
    collection do
      post :add, path: ':id/add'
      get :checkout
    end
  end

  resources :orders, only: [:index, :show, :create] do
    member do
      put :cancel # PUT orders/2/cancel
      get :pay
      post :paid
    end
  end
  
  namespace :admin do
    root 'courses#index'
    resources :courses
  end
end
