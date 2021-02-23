class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchased_item = UserPurchased.new
  end


  def create
    @purchased_item = UserPurchased.new(purchase_params)
    if @purchased_item.valid?
      @purchased_item.save
      redirect_to action: :index
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end

end
