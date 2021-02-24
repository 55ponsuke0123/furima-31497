class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_purchased = UserPurchased.new
  end

  def new
    @user_purchased = UserPurchased.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_purchased = UserPurchased.new(purchased_params)
    if @user_purchased.valid?
      @user_purchased.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private



  def purchased_params
    params.require(:user_purchased).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :user_id, :item_id).merge( item_id: params[:item_id], user_id: current_user.id)#token: params[:token], )
  end

  

end
