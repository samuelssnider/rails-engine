module Api
	module V1
		class InvoicesController < ApplicationController
			def index
				if params[:merchant_id]
					merchant = Merchant.find(params[:merchant_id])
					render json: merchant.invoices.all
				else
					render json: Invoice.all
				end
			end
		end
	end
end
		