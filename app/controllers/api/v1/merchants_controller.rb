module Api
	module V1
		class MerchantsController < ApplicationController
			
			def index
				render json: Merchant.all
			end
			
			def show
				unless params[:id] == "find"
					render json: Merchant.find(params[:id])
				else
					redirect_to : 
			end
		
		end
	end
end