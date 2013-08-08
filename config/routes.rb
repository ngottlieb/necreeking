Necreeking::Application.routes.draw do

  get "regions/index"

  get "regions/show"

  root :to => "home#how_it_works"
  
  match 'how-it-works' => 'home#how_it_works', :as => :how_it_works
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users
  
  resources :reports, :only => ["index", "new"] do
    get 'page/:page', :action => :index, :on => :collection
  end
  
  match 'twilio' => 'twilio#incoming_sms', :as => :incoming_sms
  
end