module Api
	module V1
		module Customers
			class FavoriteMerchantController < ApplicationController
				def index
					render json: Customer.find(params[:customer_id]).favorite_merchant
				end
			end
		end
	end
end