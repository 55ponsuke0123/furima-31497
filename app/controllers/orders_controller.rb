class OrdersController < ApplicationController

  def index
    @orders = UserDetail.includes(:purchased_item)
  end

  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :purchased_item_id, :user_id, :item_id)
  end
end
