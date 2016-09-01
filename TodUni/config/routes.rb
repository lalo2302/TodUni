Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'callbacks' }

	scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

		root "home#index"
		devise_for :users, skip: :omniauth_callbacks, :controllers => { :registrations => "registrations" }
		resources :dashboards, :only => :show
    resources :profiles, :only => :show

    resources :projects do
			resources :comments
		end

		resources :comments do
			resources :comments
		end

    get 'projects/d/:id', to: 'projects#dashboard', as: 'project_dashboard'
	end

	resources :locales do
		resources :translations, constraints: { :id => /[^\/]+/ }
	end

	patch 'projects/add_members/:id', :to => 'projects#add_members', :as => 'add_members'
  patch 'projects/add_tags/:id', :to => 'projects#add_tags', :as => 'add_tags'
  patch 'projects/update_picture/:id', :to => 'projects#update_picture', :as => 'update_picture'
	get 'tags/:tag', :to => 'projects#index'
  #match 'dashboards/:id', :to => "dashboards#show", :as => :username, :via => :get

  resources :tags

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
