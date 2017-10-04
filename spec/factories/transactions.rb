FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "Derp"
    credit_card_expiration_date "Herp"
    result 1
  end
end
