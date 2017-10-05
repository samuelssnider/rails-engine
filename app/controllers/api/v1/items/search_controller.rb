module Api
	module V1
		module Items
			class SearchController < ApplicationController
				def show
					if params["unit_price"]
						params["unit_price"] = (params["unit_price"].to_f * 100).to_i
					end
					render json: Item.find_by(search_params)
				end
				
				def index 
					if params["unit_price"]
						params["unit_price"] = (params["unit_price"].to_f * 100).to_i
					end
					render json: Item.where(search_params)
				end
				
				private
				
				def search_params
					params.permit(:id, :name, :description, :unit_price, :merchant_id,
						            :created_at, :updated_at)
				end
			end
		end
	end
end