require 'rails_helper'

RSpec.describe User, type: :model do
  before 'ユーザー管理機能' do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが6文字以下で登録できる' do
        @user.nickname = 'shira'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、名字が必須である' do
        @user.first_name = '名字'
        @user.last_name = '名字'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、名前が必須である' do
        @user.first_name = '名前'
        @user.last_name = '名前'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、全角（漢字）で入力させる' do
        @user.first_name = '漢字'
        @user.last_name = '漢字'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、全角（ひらがな）で入力させる' do
        @user.first_name = 'ひらがな'
        @user.last_name = 'ひらがな'
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、全角（カタカナ）で入力させる' do
        @user.first_name = 'カタカナ'
        @user.last_name = 'カタカナ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナは、名字が必須である' do
        @user.sex_kana = 'ミョウジ'
        @user.name_kana = 'ミョウジ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナは、名前が必須である' do
        @user.sex_kana = 'ナマエ'
        @user.name_kana = 'ナマエ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）で入力させる' do
        @user.sex_kana = 'カタカナ'
        @user.name_kana = 'カタカナ'
        expect(@user).to be_valid
      end
      it 'メールアドレスは@を含む必要がある' do
        @user.email = 'shirarin@gmail.com '
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'パスワードは半角英数字混合である' do
        @user.password = 'a1b2c3'
        @user.password_confirmation = 'a1b2c3'
        expect(@user).to be_valid
      end
      it '生年月日が必須である' do
        @user.birthday = '1984-09-09'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
