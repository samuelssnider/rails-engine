module Api
	module V1
		module Customers
			class RandomController < ApplicationController
				def show
					sql = "SELECT id FROM customers ORDER BY RANDOM() LIMIT 1;"
					customer = Customer.find(ActiveRecord::Base.connection.execute(sql).values)
					render json: customer
				end
			end
		end
	end
end