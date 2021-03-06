GELICDb::Application.routes.draw do
  resources :videos

  resources :audios, except: [:edit, :update] do
    get :file, on: :member
  end

  resources :countries

  resources :states

  resources :cities

  resources :transcriptions do
    get :file, on: :member
  end

  resources :reviewers, path: '/transcriptions/:id_midia/reviewers', only: [:create]
  get "/transcriptions/:id_midia/reviewers/all" => "transcriptions#all", as: :reviewers_all
  get '/' => 'home#index'
  resources :members, :id => /[^\/]+/
  resources :media, :id => /[^\/]+/
  resources :idioms, path: '/media/:id_midia/idioms', only: [:new, :create, :destroy]
  resources :countries, path: '/media/:id_midia/countries', only: [:new, :show, :create, :destroy]
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

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
