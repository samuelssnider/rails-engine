module Api
	module V1
		module Merchants
			class RevenueByDateController < ApplicationController
				def index
					merchant = Merchant.find(params[:merchant_id])
					render json: {revenue: (merchant.total_revenue(params["date"]).to_f/100.0).to_s}
				end
			end
		end
	end
end