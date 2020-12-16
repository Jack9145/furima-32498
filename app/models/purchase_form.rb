class PurchaseForm
  include ActiveModel::Model
  attr_accessor :card_type, :expire_month, :expire_year, :security_code, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A^(0{1}\d{9,10})$\z/, message: 'is invalid' }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :building, format: { with: /\A[ぁ-んァ-ヶ一-龥々０-９]+\z/, message: 'is invalid' }, allow_blank: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building: building, purchase_id: purchase.id)
  end
end
