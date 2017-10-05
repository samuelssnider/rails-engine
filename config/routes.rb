Rails.application.routes.draw do
  namespace :api do
  	namespace :v1 do
  		resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]
        get 'favorite_customer', to: 'merchants/favorite_customer#index'
        get 'revenue', to: 'merchants/revenue_by_date#index'
        collection do
          get 'find',     to: 'merchants/search#show'
          get 'find_all', to: 'merchants/search#index'
          get 'random', to: 'merchants/random#show'
          get 'most_items', to: 'merchants/most_items#index'
          get 'most_revenue', to: 'merchants/most_revenue#index'
        end
      end
      
      resources :transactions, only: [:index, :show] do
        get 'invoice', to: 'transactions/invoices#index'
        collection do
          get 'find',     to: 'transactions/search#show'
          get 'find_all', to: 'transactions/search#index'
          get 'random', to: 'transactions/random#show'
        end
      end
      
      resources :customers, only: [:index, :show] do
        resources :transactions, only: [:index]
        resources :invoices, only: [:index]
        get 'favorite_merchant', to: 'customers/favorite_merchant#index'
        collection do
          get 'find',     to: 'customers/search#show'
          get 'find_all', to: 'customers/search#index'
          get 'random', to: 'customers/random#show' 
        end   
      end
      
      resources :invoice_items, only: [:index, :show] do
        # resources :invoices, only: [:index]
        get 'item', to: 'invoice_items/items#index'
        get 'invoice', to: 'invoice_items/invoices#index'
        collection do
          get 'find',     to: 'invoice_items/search#show'
          get 'find_all', to: 'invoice_items/search#index'
          get 'random', to: 'invoice_items/random#show'
        end
      end
      
			resources :invoices, only: [:index, :show] do
        resources :transactions, only: [:index]
        resources :invoice_items, only: [:index]
        resources :items, only: [:index]
        get 'customer', to: 'invoices/customers#index'
        get 'merchant', to: 'invoices/merchants#index'
        collection do
          get 'find',     to: 'invoices/search#show'
          get 'find_all', to: 'invoices/search#index'
          get 'random', to: 'invoices/random#show' 
        end 
			end
      
			resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index]
        get 'merchant', to: 'items/merchants#index'
        collection do
          get 'most_revenue', to: 'items/most_revenue#index'
          get 'most_items', to: 'items/most_items#index'
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
