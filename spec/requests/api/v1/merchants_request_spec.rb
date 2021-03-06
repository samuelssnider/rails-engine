require 'rails_helper'

describe 'Merchants API' do
	include Helper
	it "sends a list of merchants" do
		create_list(:merchant, 10)
		
		get '/api/v1/merchants'
		
		merchants = JSON.parse(response.body)
		
		expect(response).to be_success
		expect(merchants).not_to be_empty
		expect(merchants.count).to eq(10)
		expect(response).to have_http_status(200)
	end
	
	it "sends a single merchant" do
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
	
	it "can find a merchant" do
		create_stuff
		m = Merchant.last
		get "/api/v1/merchants/find?id=#{m.id}"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants.count).to eq(2)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchant" do
		create_stuff
		m = Merchant.last
		get "/api/v1/merchants/find_all?name=#{m.name}"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants.count).to eq(2)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchant's invoices" do
		create_stuff
		m = Merchant.first
		get "/api/v1/merchants/#{m.id}/invoices"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants.count).to eq(3)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchant's items" do
		create_stuff
		m = Merchant.first
		get "/api/v1/merchants/#{m.id}/items"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants.count).to eq(1)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchant's favorite customer" do
		create_stuff
		m = Merchant.first
		get "/api/v1/merchants/#{m.id}/favorite_customer"
		
		customers = JSON.parse(response.body)
		
		expect(customers.count).to eq(3)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchant's revenue" do
		create_stuff
		m = Merchant.first
		get "/api/v1/merchants/#{m.id}/revenue"
		
		revenue = JSON.parse(response.body)
		
		expect(revenue.count).to eq(1)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchant with the most items sold" do
		create_stuff
		get "/api/v1/merchants/most_items"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants.count).to eq(1)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchant with the most revenue" do
		create_stuff
		get "/api/v1/merchants/most_revenue"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants.count).to eq(1)
		expect(merchants.first.count).to eq(2)
		expect(response).to have_http_status(200)
	end
	
	it "can find a merchants ranked by revenue" do
		create_stuff
		get "/api/v1/merchants/revenue"
		
		merchants = JSON.parse(response.body)
		
		expect(merchants.count).to eq(1)
		expect(merchants.first.count).to eq(2)
		expect(response).to have_http_status(200)
	end
end