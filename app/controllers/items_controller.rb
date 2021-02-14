class ItemsController < ApplicationController
  def index
     @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
  end

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
