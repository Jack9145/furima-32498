require 'rails_helper'
  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザーの新規登録' do
      context '新規登録がうまくできる時' do
        it "全ての項目が所定のフォームで埋められている" do
          expect(@user).to be_valid
        end
      end
    
      context '新規登録がうまくいかない時' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空だと登録できない' do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '同じメールアドレスでは登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'メールアドレスに@を含まないと登録できない' do
          @user.email = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it 'パスワードがないと登録できない' do 
          @user.password = ""
          @user.password_confirmation= ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'パスワードは6文字以上でないと登録できない' do
          @user.password = "aa11"
          @user.password_confirmation = "aa11"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'パスワードが半角英数字混合でないと登録できない(半角英字のみ)' do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'パスワードが半角英数字混合でないと登録できない(半角数字のみ)' do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end
        
        it 'パスワードが半角英数字混合でないと登録できない(全角英数字)' do
          @user.password = "２２２ｂｂｂ"
          @user.password_confirmation = "２２２ｂｂｂ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it 'パスワードが確認用と一致しなければ登録できない' do
          @user.password = "aaaaaa1"
          @user.password_confirmation = "bbbbbb2"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
    

        it '名字（全角）が入力されていないと登録できない' do
          @user.zenkaku_family_name = ""
          @user.valid? 
          expect(@user.errors.full_messages).to include("Zenkaku family name can't be blank")
        end

        it '名字（全角）が全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
          @user.zenkaku_family_name = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Zenkaku family name には全角文字を使用してください")
        end
        
        it '名前（全角）が入力されていないと登録できない' do
          @user.zenkaku_first_name = ""
          @user.valid? 
          expect(@user.errors.full_messages).to include("Zenkaku first name can't be blank")
        end
        
        it '名前（全角）が全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
          @user.zenkaku_first_name = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Zenkaku first name には全角文字を使用してください")
        end

        it '名字（カナ）が入力されていないと登録できない' do
          @user.kana_family_name = ""
          @user.valid? 
          expect(@user.errors.full_messages).to include("Kana family name can't be blank")
        end

        it '名字（カナ）が全角（カタカナ）以外の場合登録できない' do
          @user.kana_family_name = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana family name には全角カナ文字を使用してください")
        end
        
        it '名前（カナ）が入力されていないと登録できない' do
          @user.kana_first_name = ""
          @user.valid? 
          expect(@user.errors.full_messages).to include("Kana first name can't be blank")
        end
        
        it '名前（カナ）が全角（カタカナ）以外の場合登録できない' do
          @user.kana_first_name = "a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana first name には全角カナ文字を使用してください")
        end

        it '生年月日が入力されていないと登録できない' do 
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
  end
end
