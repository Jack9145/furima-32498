require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe 'ユーザーの新規登録' do
     it "nicknameが空だと登録できない" do
      
     end
     it "emailが空では登録できない" do
     end
   end
 end