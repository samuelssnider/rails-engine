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
					redirect_to api_v1_merchants_search_path(name: params["name"])
				end
			end
		
		end
	end
end