require 'rails_helper'

describe 'Transactions API' do
	it "sends a list of Transactions" do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		t = create(:transaction, invoice: i)
		t2 = create(:transaction, invoice: i)
		
		get '/api/v1/transactions'
		
		transactions = JSON.parse(response.body)
		
		expect(transactions).not_to be_empty
		expect(transactions.count).to eq(2)
		expect(response).to have_http_status(200)
	end
	it "sends a single transaction" do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		t = create(:transaction, invoice: i)
		
		get "/api/v1/transactions/#{Transaction.first.id}"
		
		transactions = JSON.parse(response.body)
		
		expect(response.body).to include("Derp")
		expect(Transaction.count).to eq(1)
		expect(response).to have_http_status(200)
	end
	it "sends a random transaction"  do
		m = create(:merchant)
		c = create(:customer)
		i = create(:invoice, merchant: m, customer: c)
		t = create(:transaction, invoice: i)
		t2 = create(:transaction, invoice: i)
		t3 = create(:transaction, invoice: i)
		
		get "/api/v1/transactions/random"
		
		transactions = JSON.parse(response.body)
		
		expect(transactions).not_to be_empty
		expect(response).to have_http_status(200)
	end
end