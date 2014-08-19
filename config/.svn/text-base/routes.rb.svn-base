ContextServices::Application.routes.draw do
  resources :icons

  resources :subscribers

  # We do not want users to create their own accounts so we can skip registrations
  devise_for :users, :skip => :registrations
  
  resources :events do
    get 'send_mail'
    resources :point_of_interests
  end

  resources :categories

  match 'events/type/:category_id' => 'events#type', :via => :get, :as => "event_type"
  match 'poi/:id' => 'point_of_interests#show', :via => :get
  
  root :to => "events#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
