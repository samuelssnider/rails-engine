module Api
	module V1
		class CustomersController < ApplicationController
			
			def index
				render json: Customer.all
			end
			
			def show
				unless params[:id] == "find"
					render json: Customer.find(params[:id])
				else
					redirect_to api_v1_customers_search_path(name: params["name"])
				end
			end
		
		end
	end
end