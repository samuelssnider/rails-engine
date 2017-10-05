module Api
	module V1
		module Items
			class MostRevenueController < ApplicationController
				def index
					if params[:quantity]
						render json: Item.unscoped.most_revenue(params["quantity"])
					else
						render json: Item.unscoped.most_revenue
					end
				end
			end
		end
	end
end