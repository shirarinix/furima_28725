class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = PurchaseAddress.new(purchase_address_params)
    if @purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number)
                                     .merge(user_id: current_user.id, item_id: params[:item_id])
  end 
end
