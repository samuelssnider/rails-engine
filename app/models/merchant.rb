class Merchant < ApplicationRecord
	has_many :items
	has_many :invoices
	has_many :customers, through: :invoices
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
	
	def total_revenue(date = nil)
		unless date
			Invoice.select("invoices.*, sum(invoice_items.quantity*invoice_items.unit_price) as total_revenue")
			.joins(:invoice_items, :transactions)
			.merge(Transaction.unscoped.successful).group(:id)
			.where('merchant_id = ? and result = ?', self.id, "0")
			.map(&:total_revenue)
			.sum
		else
			date = Date.parse(date)
			Invoice.select("invoices.*, sum(invoice_items.quantity*invoice_items.unit_price) as total_revenue")
			.joins(:invoice_items, :transactions)
			.merge(Transaction.unscoped.successful).group(:id)
			.where('merchant_id = ? and result = ? and created_at = ?', self.id, "0", date.midnight..date.end_of_day )
			.map(&:total_revenue)
			.sum
		end
	end
	
	def favorite_customer
    Customer.select("customers.*, count(transactions)")
            .joins(invoices: :transactions)
            .where("merchant_id = ? AND result = ?", id, "0")
            .group("id")
            .order("count DESC")
            .first
  end
	
	def paid_invoices
		invoices
		.joins(:invoice_items, :transactions)
		.merge(Transaction.unscoped.successful)
	end
	# def favorite_customer
	# 	Customer.select("customer.*, count(transactions)")
	# 	.joins(:invoices)
	# 	.joins(:transactions)
	# end
end
