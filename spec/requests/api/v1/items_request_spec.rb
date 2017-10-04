require 'rails_helper'

describe 'Items API' do
	it "sends a list of items" do
		create_list(:item, 10)
		
		get '/api/v1/items'
		
		items = JSON.parse(response.body)
		
		expect(response).to be_success
		expect(items).not_to be_empty
		expect(items.count).to eq(10)
		expect(response).to have_http_status(200)
	end
	
	xit "sends a single merchant" do
		create_list(:merchant, 1)
		
		get "/api/v1/merchants/#{Merchant.first.id}"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants).not_to be_empty
		expect(Merchant.count).to eq(1)
		expect(response).to have_http_status(200)
	end
	
	it "sends a random merchant"  do
		create_list(:merchant, 20)
		
		get "/api/v1/merchants/random"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants).not_to be_empty
		expect(response).to have_http_status(200)
	end
end