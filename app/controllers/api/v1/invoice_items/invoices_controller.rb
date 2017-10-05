module Api
	module V1
		module InvoiceItems
			class InvoicesController < ApplicationController
				def index
					invoice_item = InvoiceItem.find(params[:invoice_item_id])
					render json: invoice_item.invoice
				end
			end
		end
	end
end