module Api
	module V1
		class MerchantsController < ApplicationController
			
			def index
				if params[:invoice_id]
					invoice = Invoice.find(params[:invoice_id])
					render json: invoice.merchant
				elsif params[:item_id]
					item = Item.find(params[:item_id])
					render json: item.merchant
				else
					render json: Merchant.all
				end
			end
			
			def show
				render json: Merchant.find(params[:id])
			end
		end
	end
end