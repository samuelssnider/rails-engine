module Api
	module V1
		class ItemsController < ApplicationController
			def index
				if params[:merchant_id]
					merchant = Merchant.find(params[:merchant_id])
					render json: merchant.items.all
				else
					render json: Item.all
				end
			end
		end
	end
end