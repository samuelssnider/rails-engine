require 'rails_helper'

describe 'Items API' do
	it "sends a list of items" do
		m = create(:merchant)
		create(:item, merchant: m)
		create(:item, merchant: m)
		
		get '/api/v1/items'
		
		items = JSON.parse(response.body)
		
		expect(response.body).to include("MyString")
		expect(items).not_to be_empty
		expect(items.count).to eq(2)
		expect(response).to have_http_status(200)
	end
	
	it "sends a single item" do
		m = create(:merchant)
		i = create(:item, merchant: m)
		
		get "/api/v1/items/#{Item.first.id}"
		
		items = JSON.parse(response.body)
		
		expect(items).to have_value("MyString")
		expect(Merchant.count).to eq(1)
		expect(response).to have_http_status(200)
	end
	
	it "sends a random item"  do
		m = create(:merchant)
		i = create(:item, merchant: m)
		i2 = create(:item, merchant: m)
		
		get "/api/v1/items/random"
		
		items = JSON.parse(response.body)
		
		expect(items).not_to be_empty
		expect(response).to have_http_status(200)
	end
end