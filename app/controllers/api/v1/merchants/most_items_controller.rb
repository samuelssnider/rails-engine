module Api
	module V1
		module Merchants
			class MostItemsController < ApplicationController
				include SalesAnalyst
				def index
					binding.pry
				end
			end
		end
	end
end