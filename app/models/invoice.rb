class Invoice < ApplicationRecord
  has_many :transactions
  has_many :invoice_items
  belongs_to :customer
  belongs_to :merchant
  has_many :items, through: :invoice_items
  
  enum status: ["shipped"]
  
  def self.most_expensive(limit = 5)
    select("invoices.*, sum(invoice_items.quantity*invoice_items.unit_price) as total_revenue")
    .joins(:transactions, :invoice_items)
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order('total_revenue DESC')
    .limit(limit)
  end
    
end
