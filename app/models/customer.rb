class Customer < ApplicationRecord
	
	has_many :invoices
	has_many :merchants, through: :invoices
	has_many :transactions, through: :invoices
	
	def favorite_merchant
		merchants.select("merchants.*, sum(invoice_items.quantity*invoice_items.unit_price) as total_revenue")
		.joins(invoices: [:invoice_items, :transactions, :customers])
		.merge(Transaction.unscoped.successful)
		.group(:id).order('total_revenue DESC')
		.limit(1)
	end
	
end
