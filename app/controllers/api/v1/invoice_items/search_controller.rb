module Api
	module V1
		module InvoiceItems
			class SearchController < ApplicationController
				def show
					if params["unit_price"]
						params["unit_price"] = (params["unit_price"].to_f * 100).to_i
					end
					render json: InvoiceItem.find_by(search_params)
				end
				
				def index
					if params["unit_price"]
						params["unit_price"] = (params["unit_price"].to_f * 100).to_i
					end
					render json: InvoiceItem.where(search_params)
				end
				
				private
				
				def search_params
					params.permit(:id, :item_id, :invoice_id, :quantity,
						 						:unit_price, :created_at, :updated_at )
				end
			end
		end
	end
end