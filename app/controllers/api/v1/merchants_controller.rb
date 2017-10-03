module Api
	module V1
		class MerchantsController < ApplicationController
			
			def index
				render json: Merchant.all
			end
			
			def show
				unless params[:id] == "find" || params[:id] == "find_all"
					render json: Merchant.find(params[:id])
				else
					if params[:id] == "find"
					redirect_to api_v1_merchants_search_path(name: params["name"],
																									 #  id: params["id"],
																									 created_at: params["created_at"],
																									 updated_at: params["updated_at"])
																									 if params[:id] == "find"
					else
						redirect_to api_v1_merchants_search_index_path(name: params["name"],
																										 #  id: params["id"],
																										 created_at: params["created_at"],
																										 updated_at: params["updated_at"])
					end
				end
			end
		end
	end
end