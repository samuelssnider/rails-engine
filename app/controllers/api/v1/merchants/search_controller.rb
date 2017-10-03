module Api
	module V1
		module Merchants
			class SearchController < ApplicationController
				def show
					merchant = Merchant.find_by(name: params["name"])
					binding.pry
					redirect_to api_v1_merchant_path(merchant)
				end
			end
		end
	end
end