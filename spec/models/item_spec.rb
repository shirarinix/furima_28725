require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/camera.png')
  end

  describe '商品情報の入力' do
    context '商品情報の入力がうまくいくとき' do
      it '出品画像、商品名、商品の説明、商品の詳細、配送について、販売価格がそれぞれ存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '画像が１枚必須であること' do
        expect(@item.image).to be_valid
      end
      it '商品名が必須であること' do
        @item.name= '鬼滅の刃'
        expect(@item).to be_valid
      end
      it '商品の説明が必須であること' do
        @item.introduction = '1'
        expect(@item).to be_valid
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it '商品の状態についての情報が必須であること' do
        @item.product_id = '3'
        expect(@item).to be_valid
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_id = '4'
        expect(@item).to be_valid
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = '5'
        expect(@item).to be_valid
      end
      it '発送までの日数についての情報が必須であること' do
        @item.preparation_id = '6'
        expect(@item).to be_valid
      end
      it '価格についての情報が必須であること' do
        @item.selling_price = '500'
        expect(@item).to be_valid
      end
      it '価格の範囲が、¥300〜¥9,999,999の間であること' do
        @item.selling_price = '300~9999999'
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまくいかないとき' do
      it '出品画像が入力されていないと出品できない' do
        # @user.nickname = ' '
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '商品名が入力されていないと出品できない' do
        # @user.email = ' '
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '商品の説明が入力されていないと出品できない' do
        # @user.password = ' '
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'カテゴリーが入力されていないと出品できない' do
        # @user.password = 'ab123'
        # @user.valid?
        # expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '商品の状態が入力されていないと出品できない' do
      end
      it '配送料の負担が入力されていないと出品できない' do
      end
      it '発送元の地域が入力されていないと出品できない' do
      end
      it '発送までの日数が入力されていないと出品できない' do
      end
      it '販売価格が入力されていないと出品できない' do
      end
    end
  end
end
