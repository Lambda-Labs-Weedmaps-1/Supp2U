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
      resources :users, only: [:index, :show, :create] do
        resources :customers, only: [:index, :show, :create]
        resources :businesses, only: [:index, :show, :create]
      end

      resources :businesses, only: [:index, :show] do
        resources :menus, only: [:index, :show, :create]
      end

      resources :customers, only: [:index, :show] do
        resources :reviews, only: [:index, :show, :create]
      end

      resources :menus, only: [:index, :show] do
        resources :items, only: [:index, :show, :create]
      end
    end
  end
end
