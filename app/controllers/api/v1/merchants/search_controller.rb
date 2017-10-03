module Api
	module V1
		module Merchants
			class SearchController < ApplicationController
				def show
					merchant = Merchant.find(params[:id])
					binding.pry
					redirect_to merchant_path(merchant)
				end
			end
		end
	end
end