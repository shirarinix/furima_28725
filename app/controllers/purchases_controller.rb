class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  # before_action :move_to_new

  def new
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_address_params)
    if @purchase.valid?
      pay_item
      @purchase.save
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
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(                             # PAY.JPテスト秘密鍵
      amount: @item.selling_price,
      card: purchase_address_params[:token],          # カードトークン
      currency:'jpy'                                  # 通貨の種類(日本円)
    )
  end

  # def move_to_new
  #   unless user_signed_in?
  #     redirect_to root_path
  #   end
  # end
end