require 'rails_helper'

describe 'Invoice Items API' do
	it "sends a list of Invoice Items" do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		it = create(:item, merchant: m)
		ii = create(:invoice_item, invoice: i, item: it)
		ii2 = create(:invoice_item, invoice: i, item: it)
		ii3 = create(:invoice_item, invoice: i, item: it)
		get '/api/v1/invoice_items'
		
		invoice_items = JSON.parse(response.body)
		
		expect(response.body).to include("unit_price")
		expect(invoice_items).not_to be_empty
		expect(invoice_items.count).to eq(3)
		expect(response).to have_http_status(200)
	end
	
	it "sends a single Invoice Item" do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		it = create(:item, merchant: m)
		ii = create(:invoice_item, invoice: i, item: it)
		get '/api/v1/invoice_items'
		
		expect(response.body).to include("unit_price")
		expect(response).to have_http_status(200)
	end
	
	it "sends a random Invoice Item"  do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		it = create(:item, merchant: m)
		ii = create(:invoice_item, invoice: i, item: it)
		ii2 = create(:invoice_item, invoice: i, item: it)
		ii3 = create(:invoice_item, invoice: i, item: it)
		
		get "/api/v1/invoice_items/random"
		
		customers = JSON.parse(response.body)
		
		expect(customers).not_to be_empty
		expect(response).to have_http_status(200)
	end
end