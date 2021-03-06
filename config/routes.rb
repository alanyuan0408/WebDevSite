UoftWebSite::Application.routes.draw do
  resources :users
  resources :feedbanks
  resources :sessions, only: [:new, :create, :destroy]

  # The priority is based upon order of creation:
  # first created -> highest priority.  get "home" => "static_pages#home"

    # You can have the root of your site routed with "root"
  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/update', to: 'users#edit'

  match '/developer',  to: 'static_pages#developer'
  match '/jobs',     to: 'static_pages#jobs'
  match '/useraccount',   to: 'static_pages#useraccount'
  match '/entrepreneur', to: 'static_pages#entrepreneur'
  match '/home',      to: 'static_pages#home'
  match '/event',      to: 'static_pages#events'
  match '/news',      to: 'static_pages#news'

  match '/register_expo', to: 'users#register_expo'
  match '/unregister_expo', to: 'users#unregister_expo'

  match '/student_account', to: 'users#student_account'
  match '/creator_account', to: 'users#creator_account'

  match '/approve', to: 'users#approve_creator'
  match '/request', to: 'users#request_creator'
  match '/certify', to: 'users#certify'

  match '/confirmation_token', to: 'users#confirmation_token'
  
  match "/404" => 'users#permissiondenied'
  match "/500" => 'users#permissiondenied'

  match "/feedbanks" => 'feedbanks#show'
  match "/feedcreate" => 'feedbanks#create'
  match "/feedapprove" => 'feedbanks#approve_content'
  match "/feeddisapprove" => 'feedbanks#disapprove_content'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
