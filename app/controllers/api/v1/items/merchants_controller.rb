module Api
	module V1
		module Items
			class MerchantsController < ApplicationController
				def index
					item = Item.find(params[:item_id])
					render json: item.merchant
				end
			end
		end
	end
end