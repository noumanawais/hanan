Bootstrap::Application.routes.draw do
  

  devise_for :users, :controllers => { :registrations => "users/registrations" , :sessions => "users/sessions", :passwords => "users/passwords"}




  get "welcome/index"

  get "experiance/new"

  post "experiance/create"

  post "search/profile"

  post "search/search_results"
  post "search/search_result"
  post "search/connect"
  get "search/showFriends"
  post "search/showFriends"
  get "search/profile"
  get "search/requests"
  post "search/requests"
 
  put"search/profile"

  get "welcome/whatislinkedin"
  
  get "search/search_results"
  get "search/search_result"

  get "search/advance"

  post "search/advance"

  get "search/index"

  get "search/like"

  get "home/index"

  get "welcome/joinin"

  get "welcome/signin"

  get "welcome/bycountry"

  get "welcome/useragreement"



  get "welcome/cookies"

  get "welcome/passwordreset"

  get "welcome/privacypolicy"

  post "search/addPost"

  post "search/addComment"

  get "users/show"

  resources :feedbacks

  #devise_for :admin_users, ActiveAdmin::Devise.config

  get "secure/index"

  get "home/index"

  devise_for :users

  #resources :users, :only => [:show]
  resources :users

  get 'users/:id/edit2' => 'users#edit'

  # get "home/index"

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
   root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

  #root :to => "home#index"
#  match ':controller(/:action(/:id(.:format)))'
  match 'home/index' => 'home#index'

end
