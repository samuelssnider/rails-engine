module Api
	module V1
		class CustomersController < ApplicationController
			
			def index
				if params[:invoice_id]
					invoice = Invoice.find(params[:invoice_id])
					customer = invoice.customer
				else
					render json: Customer.all
				end
			end
			
			def show
				render json: Customer.find(params[:id])
			end
		
		end
	end
end