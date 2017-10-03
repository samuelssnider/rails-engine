module Api
	module V1
		module Merchants
			class SearchController < ApplicationController
				def show
					merchant = Merchant.find_by(search_params)
					redirect_to api_v1_merchant_path(merchant)
				end
				
				private
				
				def search_params
					params.permit(:id, :name, :created_at, :updated_at)
				end
			end
		end
	end
end