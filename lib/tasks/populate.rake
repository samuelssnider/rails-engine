require 'rake'
require 'csv'
  
desc "Reset"
task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:test:prepare", "db:seed", "app:populate"]

task :populate => :environment do
  # Rake::Task['db:drop'].invoke
	# Rake::Task['db:create'].invoke
  CSV.foreach(Rails.root + 'db/data/merchants.csv', {:headers=>:first_row}) do |row|
    puts "Adding #{row["name"]} as a merchant"
    Merchant.create!(name: row["name"],
			 							 created_at: row["created_at"],
										 updated_at: row["updated_at"] )
  end
	puts "The database has been populated with #{Merchant.all.count} merchants"
	
	CSV.foreach(Rails.root + 'db/data/customers.csv', {:headers=>:first_row}) do |row|
    puts "Adding #{row["first_name"]} #{row["last_name"]} as a customer"
    Customer.create!(first_name: row["first_name"],
			 							 last_name:  row["last_name"],
			 							 created_at: row["created_at"],
										 updated_at: row["updated_at"] )
  end
	puts "The database has been populated with #{Customer.all.count} customers"
	
	CSV.foreach(Rails.root + 'db/data/invoices.csv', {:headers=>:first_row}) do |row|
    puts "Adding #{row["id"]} as a invoice"
    Invoice.create!(customer_id: row["customer_id"],
			 							merchant_id: row["merchant_id"],
										status:      row["status"],
										created_at:  row["created_at"],
										updated_at:  row["updated_at"]  )
  end
	puts "The database has been populated with #{Invoice.all.count} Invoices"
	
	CSV.foreach(Rails.root + 'db/data/items.csv', {:headers=>:first_row}) do |row|
    puts "Adding #{row["name"]} as a invoice"
  	Item.create!(name:        row["name"],
		 						 description: row["description"],
								 unit_price:  row["unit_price"],
								 merchant_id: row["merchant_id"],
								 created_at:  row["created_at"],
								 updated_at:  row["updated_at"]  )
  end
	puts "The database has been populated with #{Item.all.count} Items"
	
	CSV.foreach(Rails.root + 'db/data/transactions.csv', {:headers=>:first_row}) do |row|
    puts "Adding #{row["id"]} as a transaction"
    Transaction.create!(invoice_id:                  row["invoice_id"],
			 							    credit_card_number:          row["credit_card_number"],
										    credit_card_expiration_date: row["credit_card_expiration_date"],
												result:                      row["result"],
										    created_at:                  row["created_at"],
										    updated_at:                  row["updated_at"]                 )
  end
	puts "The database has been populated with #{Transaction.all.count} Transactions"
	
	CSV.foreach(Rails.root + 'db/data/invoice_items.csv', {:headers=>:first_row}) do |row|
    puts "Adding #{row["id"]} as a invoice item"
    InvoiceItem.create!(item_id:    row["item_id"],
												invoice_id: row["invoice_id"],
			 							    quantity:   row["quantity"],
										    unit_price: row["unit_price"],
										    created_at: row["created_at"],
										    updated_at: row["updated_at"]    )
  end
	puts "The database has been populated with #{InvoiceItem.all.count} Invoice Items"
	
end
