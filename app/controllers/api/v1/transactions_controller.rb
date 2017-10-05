module Api
	module V1
		class TransactionsController < ApplicationController
			def index
				if params[:invoice_id]
					invoice = Invoice.find(params[:invoice_id])
					render json: invoice.transactions
				else 
					render json: Transaction.all
				end
			end
			
			def show
				render json: Transaction.find(params[:id])
			end
		end
	end
end