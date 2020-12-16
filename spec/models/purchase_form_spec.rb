require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('app/assets/images/star.png')
      item.save(user_id: user.id)
      @form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
    end
    context '商品が購入できる時' do
      it '全ての入力項目が所定のフォームで入力されている時' do
        expect(@form).to be_valid
      end

      it '建物名の入力がなくても登録できる' do
        @form.building = ''
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
        expect(@form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '郵便番号が空欄の時' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が選択されていない時' do
        @form.prefecture_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が入力されていない時' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が入力されていない時' do
        @form.address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が全角数字で入力された時' do
        @form.phone_number = '０９０００００００００'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が-(ハイフン)入りで入力された時' do
        @form.phone_number = '090-0000-0000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号の入力が12桁以上だった時' do
        @form.phone_number = '090123456789'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号の入力が9桁以下だった時' do
        @form.phone_number = '090123456'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号の入力が0から始まらない時' do
        @form.phone_number = '19012345678'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが存在しない時' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが存在しない時' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
