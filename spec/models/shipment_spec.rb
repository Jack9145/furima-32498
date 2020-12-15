require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe '商品の購入' do
    before do
      @shipment = FactoryBot.build(:creditcard)
    end
    context '商品が購入できる時' do
      it '全ての入力項目が所定のフォームで入力されている時' do
        expect(@shipment).to be_valid
      end
    end

    context '商品が購入できない時' do
     it '郵便番号が空欄の時' do
      @shipment.postal_code = nil
      binding.pry
      end
    end
  end
end
