module Api
	module V1
		module Customers
			class SearchController < ApplicationController
				def show
					customer = Customer.find_by(last_name: params["last_name"])
					redirect_to api_v1_customer_path(customer)
				end
			end
		end
	end
end