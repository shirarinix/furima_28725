class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:destroy, :edit, :update, :show]

  def index
    @item = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? && @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :product_id, :delivery_id,
                                 :preparation_id, :prefecture_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
