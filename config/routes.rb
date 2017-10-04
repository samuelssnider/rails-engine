Rails.application.routes.draw do
  namespace :api do
  	namespace :v1 do
  		resources :merchants, only: [:index, :show] do
        collection do
          resources :invoices, only: [:index]
          resources :items, only: [:index]
          get 'find',     to: 'merchants/search#show'
          get 'find_all', to: 'merchants/search#index'
          get 'random', to: 'merchants/random#show'
          get 'most_revenue', to: 'merchants/most_revenue#index'
          get 'most_items', to: 'merchants/most_items#index'
          get 'revenue', to: 'merchants/revenue_by_date#index'
        end
      end
      
      resources :transactions, only: [:index, :show] do
        collection do
          get 'find',     to: 'transactions/search#show'
          get 'find_all', to: 'transactions/search#index'
          get 'random', to: 'transactions/random#show'
        end
      end
      
      resources :customers, only: [:index, :show] do
        collection do
          get 'find',     to: 'customers/search#show'
          get 'find_all', to: 'customers/search#index'
          get 'random', to: 'customers/random#show' 
        end   
      end
      
			resources :invoices, only: [:index, :show]
      
			resources :items, only: [:index, :show] do
        collection do
          get 'find',     to: 'items/search#show'
          get 'find_all', to: 'items/search#index'
          get 'random', to: 'items/random#show' 
        end
			end
      
      namespace :items do
				resources :search, only: [:show, :index]
			end
      
			namespace :merchants do
				resources :search, only: [:show, :index]
			end
      
			namespace :customers do
				resources :search, only: [:show, :index]
			end
      
      namespace :transactions do
				resources :search, only: [:show, :index]
			end
  	end
  end
end
