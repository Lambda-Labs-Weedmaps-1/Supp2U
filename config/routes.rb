Rails.application.routes.draw do
  get 'controllername/new'
  get 'controllername/create'
  # get 'home_controller/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ALL 7 ACTIONS = index, new, create, show, edit, update, destroy. 
  #EDIT and NEW will not be used.

  namespace :api do
    namespace :v1 do
      # resources :home, only: [:index, :show]
      resources :users, except: [:edit, :new] do
        resources :customers, only: [:index, :create]
        resources :businesses, only: [:index, :create]
      end

      resources :businesses, except: [:create, :edit, :new] do
        resources :menus, only: [:index, :create]
      end

      resources :customers, except: [:edit, :new] do
        resources :reviews, only: [:index, :create]
      end

      resources :menus, except: [:edit, :new] do
        resources :items, only: [:index, :create]
      end
    end
  end
end
