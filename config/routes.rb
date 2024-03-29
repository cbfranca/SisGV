SisGV::Application.routes.draw do  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

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
   root :to => 'login#login'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.


  
  resources :vocacionados
  resources :vocacionadas
  resources :benfeitores
  resources :doacoes
  resources :observacao_vocacionados
  resources :observacao_vocacionadas
  resources :usuarios

  match "vocaciondados/generate_labels" => "vocacionados#generate_labels"
  match "vocaciondados/generate_list" => "vocacionados#generate_list"
  match "vocaciondados/generate_registration_form" => "vocacionados#generate_registration_form"

  match "vocaciondadas/generate_labels" => "vocacionadas#generate_labels"
  match "vocaciondadas/generate_list" => "vocacionadas#generate_list"
  match "vocaciondadas/generate_registration_form" => "vocacionadas#generate_registration_form"

  match "generate_labels" => "benfeitores#generate_labels"
  match "generate_list" => "benfeitores#generate_list"
  match "generate_registration_form" => "benfeitores#generate_registration_form"

  match "login" => "login#login"
  match "logout" => "login#logout"
end
