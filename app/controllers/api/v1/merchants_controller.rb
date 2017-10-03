module Api
	module V1
		class MerchantsController < ApplicationController
			
			def index
				render json: Merchant.all
			end
			
			def show
				unless params[:id] == "find" 
					render json: Merchant.find(params[:id])
				else
					binding.pry
					params[:id] = nil
					redirect_to api_v1_merchants_search_path(name: params["name"],
						 																			 id: params["id"],
																									 created_at: params["created_at"],
																									 updated_at: params["updated_at"])
				end
			end
		
		end
	end
end