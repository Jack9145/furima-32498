class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date


  

  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40 ,message: "は４０文字以内で入力してください"}
    validates :text, length: {maximum: 1000, message: "は1000文字以内で入力して下さい" }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 9999999 ,message: "は¥300〜9,999,999で設定してください（半角数字）"}
    validates :category_id, numericality: { other_than: 1, message: "を選択してください"}
    validates :status_id, numericality: { other_than: 1 ,message: "を選択してください"}
    validates :shipping_fee_id, numericality: { other_than: 1 ,message: "を選択してください"}
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください"}
    validates :shipping_date_id, numericality: { other_than: 1, message: "を選択してください"}
  end
 
end
