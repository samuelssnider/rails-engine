require 'rails_helper'

describe 'Customers API' do
	it "sends a list of customers" do
		create_list(:customer, 10)
		
		get '/api/v1/customers'
		
		customers = JSON.parse(response.body)
		
		expect(response).to be_success
		expect(customers).not_to be_empty
		expect(customers.count).to eq(10)
		expect(response).to have_http_status(200)
	end
	
	it "sends a single customer" do
		create_list(:customer, 1)
		
		get "/api/v1/customers/#{Customer.first.id}"
		
		customers = JSON.parse(response.body)
		
		expect(customers).not_to be_empty
		expect(Customer.count).to eq(1)
		expect(response).to have_http_status(200)
	end
	
	it "sends a random customer"  do
		create_list(:customer, 20)
		
		get "/api/v1/customers/random"
		
		customers = JSON.parse(response.body)
		
		expect(customers).not_to be_empty
		expect(response).to have_http_status(200)
	end
end