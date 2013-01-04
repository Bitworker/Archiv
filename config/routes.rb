Erfolg::Application.routes.draw do
  # OmniAuth - for FB Connect
  match '/auth/:provider/callback' => 'authentications#create'

  devise_for :users do
    get '/logout' => 'devise/sessions#destroy'
    get "/login" => "devise/sessions#new"
  end

  resources :user, :only => [:show]

  resources :authentications
  resources :archivs, :only => [:index, :show, :new,  :edit, :create, :update, :destroy] do
    member do
      post :update_vote
      get :create_userarchivment
    end
  end

  resources :categories
  resources :extern

  # devise_for :users, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

  get "extern/index" # Status: Logged out / Landing Page in logged out state
  get "user/show" # Status: Logged in / Landing Page standard user
  get "admin/index" # Status: Logged in / Landing Page Admin

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
  # just remember to delete public/indexOLD.html.
  root :to => 'extern#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
