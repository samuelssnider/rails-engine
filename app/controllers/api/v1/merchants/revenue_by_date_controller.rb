module Api
	module V1
		module Merchants
			class RevenueByDateController < ApplicationController
				def index
					merchant = Merchant.find(params[:merchant_id])
					render json: {revenue: merchant.total_revenue}
				end
			end
		end
	end
end