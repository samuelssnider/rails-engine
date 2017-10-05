module Api
	module V1
		module Transactions
			class InvoicesController < ApplicationController
				def index
					transaction = Transaction.find(params[:transaction_id])
					render json: transaction.invoice
				end
			end
		end
	end
end