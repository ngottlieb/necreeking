Necreeking::Application.routes.draw do

  authenticated :user do
    root :to => 'home#how_it_works'
  end
  
  root :to => "home#how_it_works"
  
  match 'how-it-works' => 'home#how_it_works', :as => :how_it_works
  
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users
  
  resources :reports, :only => ["index", "new"]
  
  match 'twilio' => 'twilio#incoming_sms', :as => :incoming_sms
  
end