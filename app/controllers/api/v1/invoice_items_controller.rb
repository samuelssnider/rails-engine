module Api
	module V1
		class InvoiceItemsController < ApplicationController

			def index
				if params[:invoice_id]
					invoice = Invoice.find(params[:invoice_id])
					render json: invoice.invoice_items
				elsif params[:item_id]
					item = Item.find(params[:item_id])
					render json: item.invoice_items
				else
					render json: InvoiceItem.all
				end
			end
			
			def show
				render json: InvoiceItem.find(params[:id])
			end
		end
	end
end