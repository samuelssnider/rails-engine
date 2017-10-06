module Helper
	def create_stuff
	m = create(:merchant)
	m_2 = create(:merchant)
	c = create(:customer, first_name: "sally")
	c_2 = create(:customer)
	i = create(:invoice, merchant: m, customer: c)
	i_2 = create(:invoice, merchant: m, customer: c)
	i_3 = create(:invoice, merchant: m, customer: c_2)
	it = create(:item, merchant: m)
	ii = create(:invoice_item, invoice: i, item: it)
	ii2 = create(:invoice_item, invoice: i_2, item: it)
	ii3 = create(:invoice_item, invoice: i_3, item: it)
	t = create(:transaction, invoice: i)
	t_2 = create(:transaction, invoice: i_2)
	t_3 = create(:transaction, invoice: i_3)
	end
end