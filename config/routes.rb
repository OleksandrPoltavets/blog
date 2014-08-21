Blog::Application.routes.draw do

  # get "trips/new"
  # get "trips/index"
  # get "trips/show"
  # get "trips/destroy"
  resources :users
  resources :trips
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:create, :destroy]

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure',            to: redirect('/'),     via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  get 'create_trip', to: 'trips#new', as: 'create_trip'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  #get "home", to: 'pages#home', as: 'home'
  get 'about', to: 'pages#about', as: 'about'
  get 'contacts', to: 'pages#contacts', as: 'contacts'
  get 'apps', to: 'pages#apps', as: 'apps'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  # constraints(:host => "www.sancho.ck.ua") do
  #   match "(*x)" => redirect { |params, request|
  #     URI.parse(request.url).tap { |x| x.host = "sancho.ck.ua" }.to_s
  #   }
  # end

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
