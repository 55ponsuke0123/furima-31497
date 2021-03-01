class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  

  require 'payjp'

  def index
    if @item.user == current_user || @item.purchased_item.present?
      redirect_to root_path
    end
    @user_purchased = UserPurchased.new
  end


  def create
    @user_purchased = UserPurchased.new(purchased_params)
    if @user_purchased.valid?
      pay_item
      @user_purchased.save
       return redirect_to root_path
    else
      render :index
    end
  end



  
  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchased_params
    params.require(:user_purchased).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token).merge(purchased_item_id: params[:purchased_item_id], item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchased_params[:token],
      currency: 'jpy'
    )
  end

  
  
end
