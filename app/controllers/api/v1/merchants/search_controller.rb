module Api
	module V1
		module Merchants
			class SearchController < ApplicationController
				def show
					render json: Merchant.find_by(search_params)
				end
				
				def index 
					render json: Merchant.where(search_params)
				end
				
				private
				
				def search_params
					params.permit(:name, :created_at, :updated_at)
				end
			end
		end
	end
end