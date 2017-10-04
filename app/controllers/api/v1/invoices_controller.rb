module Api
	module V1
		class InvoicesController < ApplicationController
			
			
			def show
				
					render json: Invoice.find(params)
				end
			end
			
			def index
				if params[:invoice_item_id]
					invoice_item = InvoiceItem.find(params[:invoice_item_id])
					render json: invoice_item.invoice
				elsif params[:merchant_id]
					merchant = Merchant.find(params[:merchant_id])
					render json: merchant.invoices.all
				else
					render json: Invoice.all
				end
			end
			
		end
	end
end
		