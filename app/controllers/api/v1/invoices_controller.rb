module Api
	module V1
		class InvoicesController < ApplicationController
			
			
			def show
					render json: Invoice.find(params[:id])
			end
			
			def index
				if params[:invoice_item_id]
					invoice_item = InvoiceItem.find(params[:invoice_item_id])
					render json: invoice_item.invoice
				elsif params[:merchant_id]
					merchant = Merchant.find(params[:merchant_id])
					render json: merchant.invoices.all
				elsif params[:customer_id]
					customer = Customer.find(params[:customer_id])
					render json: customer.invoices
				elsif params[:transaction_id]
					transaction = Transaction.find(params[:transaction_id])
					render json: transaction.invoice
				else
					render json: Invoice.all
				end
			end
			
		end
	end
end
		