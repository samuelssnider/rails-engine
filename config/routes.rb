Rails.application.routes.draw do
  namespace :api do
  	namespace :v1 do
  		resources :merchants, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :items, only: [:index]
      end
			resources :invoices, only: [:index, :show]
			resources :items, only: [:index, :show]
			resources :customers, only: [:index, :show]
			namespace :merchants do
				resources :search, only: [:show]
			end
			namespace :customers do
				resources :search, only: [:show]
			end
  	end
  end
end
