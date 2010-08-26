ActionController::Routing::Routes.draw do |map|
  map.search "/search", :controller=>"lessons",:action=>"search"
  map.unlock "/unlock/:id", :controller => "users", :action=>"unlock"
  map.searchcsv "/search.csv", :controller=>"lessons",:action=>"search", :format=>"csv"
  map.sendactivation "/activate/:id", :controller => "users", :action => "activacion"
  
  #map.seedcountries "/seedc", :controller=>"countries", :action=>"seed"
  map.resources :comments

  map.resources :helps
	
  map.resources :confirm
	
  map.resources :messages

  map.resources :lessons

  map.resources :leccions

  map.resources :leccion_types

  map.resources :origins

  map.resources :ambitos

  map.resources :levels

  map.resources :lcountries

  map.resources :empresarial_sectors

 
  map.resources :resultados

  map.resources :productos

  map.resources :productive_sectors

  map.resources :users, :as => "usuarios"
  map.resources :countries

  map.resources :countries

  map.resources :ifis

  map.devise_for :users, :admin

  map.resources :home, :only => :index
  map.resources :admins, :only => [:index]

  map.root :controller => :home

end
