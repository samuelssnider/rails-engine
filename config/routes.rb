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
