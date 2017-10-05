module Api
	module V1
		module Invoices
			class CustomersController < ApplicationController
				def index
					invoice = Invoice.find(params[:invoice_id])
					render json: invoice.customer
				end
			end
		end
	end
end