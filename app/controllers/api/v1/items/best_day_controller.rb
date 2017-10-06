module Api
	module V1
		module Items
			class BestDayController < ApplicationController
				def index
					item = Item.find(params[:item_id])
					render json: item.best_day
				end
			end
		end
	end
end