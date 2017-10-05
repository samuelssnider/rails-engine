class Item < ApplicationRecord
  belongs_to :merchant
  
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  
  default_scope { order(:id)}
  
  def self.most_revenue(total = 5)
    select("items.*, sum(invoice_items.quantity*invoice_items.unit_price) as total_revenue")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order('total_revenue DESC')
    .limit(total)
  end
  
  def self.most_sold(total = 5)
    select("items.*, sum(invoice_items.quantity) as total_items_sold")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.unscoped.successful)
    .group(:id)
    .order('total_items_sold DESC')
    .limit(total)
  end
  
  def self.best_day
    invoices
    .joins(:transactions, :invoice_items)
    .merge(Transaction.unscoped.successful)
    .group(:created_at)
  end

end
