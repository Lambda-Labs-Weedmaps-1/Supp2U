Rails.application.routes.draw do
	mount Rswag::Ui::Engine => '/api-docs'
	mount Rswag::Api::Engine => '/api-docs'
	get 'controllername/new'
	get 'controllername/create'
	# get 'home_controller/index'
	root 'home#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#ALL 7 ACTIONS = index, new, create, show, edit, update, destroy.
	#EDIT and NEW will not be used.

	namespace :api do
		namespace :v1 do
			# Login
			post '/auth/login', to: 'authentication#login'

			# Search
      get 'search' => 'search#search'
      
      # Filter
      get 'filter' => 'filter#price'

			# Users -> Businesses -> Customers
			resources :users, except: %i[edit new] do
				resources :customers, only: %i[index create]
				resources :businesses, only: %i[index create]
			end

			resources :businesses, except: %i[create edit new] do
				get :ratings, on: :member
				resources :menus, only: %i[index create]
				resources :schedules, only: %i[index create]
				resources :reviews, only: %i[index]
				resources :orders, only: %i[index]
			end

			resources :customers, except: %i[create edit new] do
				resources :reviews, only: %i[index create]
				resources :carts, only: %i[index create]
				resources :orders, only: %i[index create]
			end

			resources :menus, only: %i[show update destroy] do
				resources :items, only: %i[index create]
			end

			resources :items, only: %i[show destroy update]
			resources :orderitems, only: %i[show index destroy update]
			resources :reviews, only: %i[show destroy update]
			resources :schedules, only: %i[show destroy update]

			resources :charges
			resources :carts, only: %i[show update] do
				put :add, on: :member
				get :itemfetch, on: :member
			end

			resources :orders, only: %i[show index destroy update] do
				post :ship, on: :member
				post :additem, on: :member
				resources :orderitems, only: %i[index create]
			end
		end
	end
end
