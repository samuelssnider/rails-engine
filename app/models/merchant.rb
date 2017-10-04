class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	has_many :invoice_items, through: :invoices
	has_many :transactions, through: :invoices
	
	# def most_revenue_by_items_sold(total)
			# select("merchants.*, sum(invoice_items.quantity)")
	# 	.joins(:invoices)
	# 	.joins(:transactions)
	# 	.where(transactions: (result: "success"))
	# end
	
	# def favorite_customer
	# 	Customer.select("customer.*, count(transactions)")
	# 	.joins(:invoices)
	# 	.joins(:transactions)
	# end
end
