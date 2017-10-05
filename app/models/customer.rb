class Customer < ApplicationRecord
	
	has_many :invoices
	has_many :merchants, through: :invoices
	has_many :transactions, through: :invoices
	
	def favorite_merchant
    Merchant.select("merchants.*, count(transactions)")
            .joins(invoices: :transactions)
            .where("customer_id = ? AND result = ?", id, "0")
            .group("id")
            .order("count DESC")
            .first
  end
	# def favorite_merchant
	# 	merchants.select("merchants.*, count(transactions) as total_revenue")
	# 	.joins(invoices: [:transactions, :customer])
	# 	.where("customer_id = ? AND result = ?", self.id, "0")
	# 	.group(:id)
	# 	.order('count DESC')
	# 	.limit(1)
	# end
	# 
end
