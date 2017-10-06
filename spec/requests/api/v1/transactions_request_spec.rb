require 'rails_helper'

describe 'Transactions API' do
	include Helper
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
	
	it "can find a transaction" do
		create_stuff
		t = Transaction.last
		
		get "/api/v1/transactions/find?id=#{t.id}"
		transactions = JSON.parse(response.body)
		
		expect(transactions["id"]).to eq(t.id)
		expect(transactions["invoice_id"]).to eq(t.invoice_id)
	end
	
	
	it "can find multiple transactions" do
		create_stuff
		t = Transaction.last
		
		get "/api/v1/transactions/find?status=0"
		transactions = JSON.parse(response.body)
		
		expect(transactions.count).to eq(4)
	end
	
	it "can find a transaction's invoice" do
		create_stuff
		t = Transaction.last
		
		get "/api/v1/transactions/#{t.id}/invoice"
		transactions = JSON.parse(response.body)
		
		expect(transactions["merchant_id"]).to eq(t.invoice.merchant_id)
	end
end