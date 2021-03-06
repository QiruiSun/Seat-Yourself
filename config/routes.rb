Rails.application.routes.draw do
  # get 'reviews/show'
  #
  # get 'reviews/create'
  #
  # get 'reviews/destroy'

  root 'restaurants#index'
  # get 'reservations/index'
  #
  # get 'reservations/new'
  #
  # get 'reservations/create'
  #
  # get 'reservations/destroy'
  #
  # get 'reservations/update'
  #
  # get 'reservations/edit'
  #
  # get 'reservations/show'

  # get 'sessions/create'
  #
  # get 'sessions/new'
  #
  # get 'sessions/destroy'
  resources :users, only: :index
  # post'users/restaurants' => 'restaurants#create'
  get 'users/restaurants' => 'users#show'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]
  # get 'users/new'

  resources :categories
  # get 'users/create'
  resources :reservations, only: [:new, :edit]

  resources :users, only: [:new, :create, :show] do
    resources :reservations, only: [:show, :destroy, :update, :index]
  

  end
  resources :restaurants do
    resources :reservations, only: :create
    resources :reviews, only: [:show, :create, :destroy]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
