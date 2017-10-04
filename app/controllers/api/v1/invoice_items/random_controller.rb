module Api
	module V1
		module InvoiceItems
			class RandomController < ApplicationController
				def show
					sql = "SELECT id FROM invoice_items ORDER BY RANDOM() LIMIT 1;"
					invoice_item = InvoiceItem.find(ActiveRecord::Base.connection.execute(sql).values)
					render json: invoice_item
				end
			end
		end
	end
end