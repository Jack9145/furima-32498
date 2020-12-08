class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname 
    validates :birthday 
  
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' } do
      validates :zenkaku_first_name
      validates :zenkaku_family_name
    end
  
    with_options format: { with: /\A[ァ-ヴ]+\z/, message: 'には全角カナ文字を使用してください' } do
      validates :kana_family_name
      validates :kana_first_name
    end
     
    validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: 'には英字と数字の両方を含めて設定してください'
  end
end

