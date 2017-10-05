class TotalRevenueSerializer < ActiveModel::Serializer

  
  def to_tot_json
    {revenue: self}
  end
  
  
end
