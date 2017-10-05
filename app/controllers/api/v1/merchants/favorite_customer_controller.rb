module Api
	module V1
		module Merchants
			class FavoriteCustomerController < ApplicationController
				def index
					render json: Merchant.find(params[:merchant_id]).favorite_customer
				end
			end
		end
	end
end