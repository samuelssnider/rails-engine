require 'rails_helper'

describe 'Customers API' do
	include Helper
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
		create_list(:customer, 10)
		
		get "/api/v1/customers/random"
		
		customers = JSON.parse(response.body)
		
		expect(customers).not_to be_empty
		expect(response).to have_http_status(200)
	end
	
	it "can find a specific customer" do
		create_list(:customer, 5)
		customer = Customer.last
		
		get "/api/v1/customers/find?id=#{customer.id}"
		
		expect(response.body).to include(customer.first_name)
	end
	
	it "can find a lot of customers" do
		create_list(:customer, 5)
		customer = Customer.last
		
		
		get "/api/v1/customers/find_all?first_name=#{customer.first_name}"
		
		customers = JSON.parse(response.body)
		expect(customers.count).to eq(5)
	end
	
	it "can find a customer's favorite merchant" do
		create_stuff
		c = Customer.last
		
		get "/api/v1/customers/#{c.id}/favorite_merchant"
		customers = JSON.parse(response.body)
		
		expect(customers.count).to eq(2)
		expect(response).to have_http_status(200)
	end
		
	it "can find a customer's transactions" do
		create_stuff
		c = Customer.last
		
		get "/api/v1/customers/#{c.id}/transactions"
		customers = JSON.parse(response.body)
		
		expect(customers.count).to eq(1)
		expect(customers.first.count).to eq(4)
		expect(response).to have_http_status(200)
	end
	
	it "can find a customer's invoices" do
		create_stuff
		c = Customer.last
		
		get "/api/v1/customers/#{c.id}/invoices"
		customers = JSON.parse(response.body)
		
		expect(customers.count).to eq(1)
		expect(customers.first.count).to eq(4)
		expect(response).to have_http_status(200)
		
	end
end