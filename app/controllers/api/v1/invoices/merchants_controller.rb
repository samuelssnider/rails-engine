module Api
	module V1
		module Invoices
			class MerchantsController < ApplicationController
				def index
					invoice = Invoice.find(params[:invoice_id])
					render json: invoice.merchant
				end
			end
		end
	end
end