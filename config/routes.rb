Necreeking::Application.routes.draw do
  get "reports/index"

  get "reports/new"

  get "reports/create"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end