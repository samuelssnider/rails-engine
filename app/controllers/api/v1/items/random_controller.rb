module Api
	module V1
		module Items
			class RandomController < ApplicationController
				def show
					sql = "SELECT id FROM items ORDER BY RANDOM() LIMIT 1;"
					item = Item.find(ActiveRecord::Base.connection.execute(sql).values)
					render json: item
				end
			end
		end
	end
end