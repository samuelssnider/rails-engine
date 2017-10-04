module Api
	module V1
		module Merchants
			class RandomController < ApplicationController
				def show
					sql = "SELECT id FROM merchants ORDER BY RANDOM() LIMIT 1;"
					merchant = Merchant.find(ActiveRecord::Base.connection.execute(sql).values)
					render json: merchant
				end
			end
		end
	end
end