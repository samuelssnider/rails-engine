module Api
	module V1
		module Merchants
			class SearchController < ApplicationController
				def show
					binding.pry
					# merchant = Merchant.find(params["id"])
					merchant = Merchant.find_by(name: params["name"])
					# merchant = Merchant.find_by(name: params["name"])
					# merchant = Merchant.find_by(name: params["name"])
					redirect_to api_v1_merchant_path(merchant)
				end
			end
		end
	end
end