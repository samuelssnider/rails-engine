module Api
	module V1
		module Transactions
			class RandomController < ApplicationController
				def show
					sql = "SELECT id FROM transactions ORDER BY RANDOM() LIMIT 1;"
					transaction = Transaction.find(ActiveRecord::Base.connection.execute(sql).values)
					render json: transaction
				end
			end
		end
	end
end