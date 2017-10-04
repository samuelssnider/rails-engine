require 'rails_helper'

describe 'Transactions API' do
	it "sends a list of Transactions" do
		create_list(:transaction, 10)
		
		get '/api/v1/transaction'
		
		transactions = JSON.parse(response.body)
		
		expect(transactions).not_to be_empty
		expect(transactions.count).to eq(10)
		expect(response).to have_http_status(200)
	end
	it "sends a single transaction" do
		create_list(:transaction, 1)
		
		get "/api/v1/transactions/#{Transaction.first.id}"
		
		transactions = JSON.parse(response.body)
		
		expect(transactions).not_to be_empty
		expect(Transaction.count).to eq(1)
		expect(response).to have_http_status(200)
	end
end