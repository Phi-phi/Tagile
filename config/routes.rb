Rails.application.routes.draw do
  root 'welcome#index'

  get 'account' => 'account#index', :as => :account
  get 'welcome/show'

  get 'upload' => 'upload#new'
  post 'upload' => 'upload#create'

  resource :tag, :controller => 'tag'
  get 'tags' => 'tag#index'
  get 'tag/:id' => 'tag#show'
  get 'search/tag/:id' => 'account#search_by_tag', :as => :search_tag
  get 'create/tag/:id' => 'account#create_tag', :as => :create_tag

  get 'edit/img/:id' => 'account#edit_img'
  patch 'edit/img' => 'account#edit_img_post'
  post 'create/tag/:id' => 'account#regist_tag'
  get 'select/tag/:tid/:img' => 'account#select_tag', :as => :select_tag 
  get 'images' => 'upload#index'
  get 'image/:id' => 'upload#show', :as => :image
  devise_for :users
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
