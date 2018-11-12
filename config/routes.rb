Blog::Application.routes.draw do
  root 'users#index'
  resources :users
  get "users/index"
  get "users/available" => 'users#index', :defaults => { :available => '1' }
  get "users/challenge"
  get "users/login" => 'users#login'

  devise_scope :user do
    get "api/v1/login" => 'users#login', :defaults => { :format => :json }
    get "api/v1/logout" => 'users#logout', :defaults => { :format => :json } #"devise/sessions#destroy", :defaults => {:method => 'delete'}

    get "api/v1/available_users" => 'users#index', :defaults => { :format => :json, :available => '1' }
    get "api/v1/all_users" => 'users#index', :defaults => { :format => :json }

    get "api/v1/challenge_computer" => "games#new", :as => 'challenge_computer', :defaults => { :computer => true, :format => :json }
    get "api/v1/challenge" => "games#new", :as => 'challenge', :defaults => { :computer => false, :format => :json }
    get "api/v1/available_ships" => "games#available_ships", :as => 'available_ships', :defaults => { :format => :json }
    get "api/v1/available_directions" => "games#available_directions", :as => 'available_directions', :defaults => { :format => :json }

    get "api/v1/game/:id/add_ship/:ship/:row/:col/:direction" => "games#add_ship", :as => 'add_ship' #, :defaults => {:format => :json}
    post "api/v1/game/:id/add_ship/" => "games#add_ship", :as => 'add_ship_POST', :defaults => { :format => :html }

    get "api/v1/game/:id" => "games#show", :as => 'game' #, :defaults => {:format => :json }

    get "api/v1/game/:id/attack/:row/:col" => "games#attack", :as => 'game_attack', :defaults => { :format => :json }
    post "api/v1/game/:id/attack" => "games#attack", :as => 'game_attack_POST', :defaults => { :format => :html }

    get "api/v1/game/:id/status/:type" => "games#status", :as => 'game_status', :defaults => { :type => :all, :format => :json }
    get "api/v1/user/challenge/:other_user_id" => "users#challenge", :as => 'user_challenge', :default => {:type=>:all, :format => :json }
    get "api/v1/user/test_gcm" => "users#test_gcm", :as => 'user_test_gcm'
  end

  devise_for :users

  get "games/new/:challenge" => "games#new", :as => 'new_game'
  get "games" => "games#index", :as => 'games_path'
  get "game/:id/default(/:placement_num)" => "games#default", :as => 'game_default'
  get "game/:id/clear_board" => "games#clear_board", :as => 'clear_board'

  get "game/:id/:board" => "games#get_board", :as => 'get_board'

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end