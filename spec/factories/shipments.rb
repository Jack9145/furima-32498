FactoryBot.define do
  factory :shipment do
    postal_code       { '111-1111' }
    city              { '札幌市' }
    address           { '中央区1-1-1' }
    building          { '' }
    phone_number      { '09011111111' }
    prefecture_id     { 2 }
    purchase
  end
end
