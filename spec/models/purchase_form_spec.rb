require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '商品の購入' do
    before do
      @form = FactoryBot.build(:purchase_form)
    end
    context '商品が購入できる時' do
      it '全ての入力項目が所定のフォームで入力されている時' do
        expect(@form).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'トークンがうまく作成されていない時' do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号に-(ハイフン)が含まれていない時' do
        @form.postal_code = '1111111'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '郵便番号が空欄の時' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
  

      it '都道府県が選択されていない時' do
        @form.prefecture_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が入力されていない時' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank", "City is invalid")
      end

      it '市区町村が半角英字で入力された時' do
        @form.city = 'aaaaa'
        @form.valid?
        expect(@form.errors.full_messages).to include("City is invalid")
      end

      it '市区町村が半角数字で入力された時' do
        @form.city = '1111111'
        @form.valid?
        expect(@form.errors.full_messages).to include("City is invalid")
      end


      it '市区町村が全角数字で入力された時' do
        @form.city = '１１１１１１'
        @form.valid?
        expect(@form.errors.full_messages).to include("City is invalid")
      end

      it '市区町村が全角英字で入力された時' do
        @form.city = 'ｓａｐｐｏｒｏ'
        @form.valid?
        expect(@form.errors.full_messages).to include("City is invalid")
      end


      it '番地が入力されていない時' do
        @form.address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank", "Address is invalid")
      end

      it '番地に全角数字が含まれている時' do
        @form.address = '中央区１-１'
        @form.valid?
        expect(@form.errors.full_messages).to include("Address is invalid")
      end

      it '番地に半角英字が含まれている時' do
        @form.address = 'chhuoku1-1'
        @form.valid?
        expect(@form.errors.full_messages).to include("Address is invalid")
      end

      it '番地に全角英字が含まれている時' do
        @form.address = 'ｃｈｕｕｏｕｋｕ1-1'
        @form.valid?
        expect(@form.errors.full_messages).to include("Address is invalid")
      end
      
      it '電話番号が全角数字で入力された時' do
        @form.phone_number= '０９０００００００００'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が-(ハイフン)入りで入力された時' do
        @form.phone_number= '090-0000-0000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end
      
      it '電話番号が11桁以上入力された時' do
        @form.phone_number= '090111122223333'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
