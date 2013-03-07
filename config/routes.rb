Necreeking::Application.routes.draw do

  authenticated :user do
    root :to => 'home#how_it_works'
  end
  
  root :to => "home#how_it_works"
  
  match 'how-it-works' => 'home#how_it_works', :as => :how_it_works
  
  devise_for :users
  resources :users
  
  resources :reports, :only => ["index", "create", "new"]
end