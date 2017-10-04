Rails.application.routes.draw do
  namespace :api do
  	namespace :v1 do
  		resources :merchants, only: [:index, :show] do
        collection do
          resources :invoices, only: [:index]
          resources :items, only: [:index]
          get 'find',     to: 'merchants/search#show'
          get 'find_all', to: 'merchants/search#index'
        end
      end
			resources :invoices, only: [:index, :show]
			resources :items, only: [:index, :show]
			resources :customers, only: [:index, :show]
			namespace :merchants do
				resources :search, only: [:show, :index]
			end
			namespace :customers do
				resources :search, only: [:show, :index]
			end
  	end
  end
end
