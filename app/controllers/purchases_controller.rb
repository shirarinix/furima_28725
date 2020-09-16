class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :item_find, only: [:new, :create]
  # before_action :direct_user, only: [:new]
  
  def new
    return redirect_to root_path item_find.user_id || item_find.purchase != nil
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_address_params)
    if @purchase.valid?
      pay_item && @purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(                             # PAY.JPテスト秘密鍵
      amount: @item.selling_price,
      card: purchase_address_params[:token],          # カードトークン
      currency: 'jpy'                                  # 通貨の種類(日本円)
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def direct_user
    if current_user.id == item_find.user_id || item_find.purchase != nil
      redirect_to root_path
    end
  end
end
