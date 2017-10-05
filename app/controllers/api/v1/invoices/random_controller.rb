module Api
	module V1
		module Invoices
			class RandomController < ApplicationController
				def show
					sql = "SELECT id FROM invoices ORDER BY RANDOM() LIMIT 1;"
					invoice = Invoice.find(ActiveRecord::Base.connection.execute(sql).values)
					render json: invoice
				end
			end
		end
	end
end