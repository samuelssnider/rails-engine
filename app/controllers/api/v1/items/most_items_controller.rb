module Api
	module V1
		module Items
			class MostItemsController < ApplicationController
				def index
					if params[:quantity]
						render json: Item.unscoped.most_sold(params["quantity"])
					else
						render json: Item.unscoped.most_sold
					end
				end
			end
		end
	end
end