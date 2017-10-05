module Api
	module V1
		class ItemsController < ApplicationController
			def index
				if params[:merchant_id]
					merchant = Merchant.find(params[:merchant_id])
					render json: merchant.items.all
				elsif params[:invoice_item_id]
					invoice_item = InvoiceItem.find(params[:invoice_item_id])
					render json: invoice_item.item
				elsif params[:invoice_id]
					invoice = Invoice.find(params[:invoice_id])
					render json: invoice.items
				else
					render json: Item.all
				end
			end
				
			def show
				render json: Item.find(params[:id])
			end
		end
	end
end