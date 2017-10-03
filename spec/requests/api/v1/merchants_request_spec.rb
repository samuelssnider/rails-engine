require 'rails_helper'

describe 'Merchants API' do
	it "sends a list of merchants" do
		create_list(:merchant, 10)
		
		get '/api/v1/merchants'
		
		merchants = JSON.parse(response.body)
		
		expect(response).to be_success
		expect(merchants).not_to be_empty
		expect(merchants.count).to eq(10)
		expect(response).to have_http_status(200)
	end
end