FactoryBot.define do
  factory :item do
    name               { '商品名' }
    text               { 'テキスト' }
    user
    price              { 10_000 }
    category_id        { 2 }
    shipping_fee_id    { 2 }
    shipping_date_id   { 2 }
    prefecture_id      { 2 }
    status_id          { 2 }
  end
end
