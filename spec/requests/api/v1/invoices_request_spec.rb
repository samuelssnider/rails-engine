require 'rails_helper'

describe 'Invoices API' do
	include Helper
	it "sends a list of Invoices" do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		i2 = create(:invoice, merchant: m, customer: c)
		
		get '/api/v1/invoices'
		
		invoices = JSON.parse(response.body)
		
		expect(response.body).to include("shipped")
		expect(invoices).not_to be_empty
		expect(invoices.count).to eq(2)
		expect(response).to have_http_status(200)
	end
	
	it "sends a single Invoice Item" do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		
		get "/api/v1/invoices/#{i.id}"
		
		invoices = JSON.parse(response.body)
		
		expect(invoices).to be_instance_of(Hash)
		expect(response).to have_http_status(200)
	end
	
	it "sends a random Invoice"  do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		ii = create(:invoice, merchant: m, customer: c)
		
		get "/api/v1/invoices/random"
		
		invoice = JSON.parse(response.body)
		
		expect(invoice).not_to be_empty
		expect(response).to have_http_status(200)
	end
	
	it "can find an invoice" do
		create_stuff
		i = Invoice.last
		
		get "/api/v1/invoices/find?id=#{i.id}"
		
		invoice = JSON.parse(response.body)
		
		expect(invoice).to have_value(i.merchant_id)
		expect(invoice.count).to eq(4)
	end
	
	it "can find multiple invoices" do
		create_stuff
		i = Invoice.last
		c = Customer.first
		
		get "/api/v1/invoices/find_all?customer_id=#{c.id}"
		
		invoice = JSON.parse(response.body)
		
		expect(invoice.first).to have_value(i.merchant_id)
		expect(invoice.count).to eq(2)
	end
end