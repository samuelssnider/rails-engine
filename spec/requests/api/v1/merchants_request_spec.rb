require 'rails_helper'

describe 'Merchants API' do
	it "sends a list of merchants" do
		create_list(:merchant, 10)
		
		get '/api/v1/items'
		
		expect(response).to have_http_status(200)
	end
end