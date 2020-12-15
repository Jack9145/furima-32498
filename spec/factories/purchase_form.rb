FactoryBot.define do
  factory :purchase_form do
    token             {"tok_abcdefghijk00000000000000000"}
    postal_code       {'111-1111'}
    city              {'札幌市'}
    address           {'中央区1-1'}
    building          {''}
    phone_number      {'09011111111'}
    prefecture_id     { 2 }
  end
end