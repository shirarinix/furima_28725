class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def update
    @item = Item.find(params[:id])
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :product_id, :delivery_id,
                                 :preparation_id, :prefecture_id, :selling_price).merge(user_id: current_user.id)
  end
end
