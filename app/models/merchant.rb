class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	has_many :invoice_items, through: :invoices
	has_many :transactions, through: :invoices
	
	def self.most_items_sold(total)
			select("merchants.*, sum(invoice_items.quantity) as total_items_sold")
			.joins(invoices: [:transactions, :invoice_items])
			.merge(Transaction.unscoped.successful)
			.group(:id)
			.order('total_items_sold DESC')
			.limit(total)
	end
	
	def self.most_revenue(total= 5)
		select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) as total_revenue")
		.joins(invoices: [:transactions, :invoice_items])
		.merge(Transaction.unscoped.successful)
		.group(:id)
		.order('total_revenue DESC')
		.limit(total)
	end

	
	# def favorite_customer
	# 	Customer.select("customer.*, count(transactions)")
	# 	.joins(:invoices)
	# 	.joins(:transactions)
	# end
end
