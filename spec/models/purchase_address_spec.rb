require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before '商品購入機能' do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能の入力' do
    context '商品購入の入力がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'tokenの入力が空だと保存ができないこと' do
        @purchase_address.token = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号の入力が空だと保存ができないこと' do
        @purchase_address.post_code = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号の入力がハイフンを含んだ正しい形でないと保存ができないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県を選択していないと保存ができないこと' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村の入力が空だと保存ができないこと' do
        @purchase_address.city = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の入力が空だと保存ができないこと' do
        @purchase_address.address = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '任意である建物名が空でも保存ができること' do
        @purchase_address.building_name = ' '
        expect(@purchase_address).to be_valid
      end
      it '電話番号の入力が空だと保存ができないこと' do
        @purchase_address.phone_number = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号の入力にはハイフンが不要で11桁以内であること' do
        @purchase_address.phone_number = '090011112222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
