module Api
	module V1
		module Merchants
			class RevenueTotalController < ApplicationController
				def index
					render json: {total_revenue: (Merchant.total_revenue(params["date"]).to_f/100.0).to_s}
				end
			end
		end
	end
end