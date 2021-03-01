class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :sold_out_item, only: [:index]
  #before_action :move_to_index, only: [:index, :new, :create]

  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
    @user_purchased = UserPurchased.new
    @purchased_item = PurchasedItem.find(params[:purchased_item_id])
  end

  def new
    @user_purchased = UserPurchased.new
  end

  def create
    @item = Item.find(params[:item_id])
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
  def sold_out_item
    if @item == @purchased_item
      redirect_to root_path
    end
  end
  
  def purchased_params
    params.require(:user_purchased).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :purchased_item_id, :user_id, :item_id, :token).merge(purchased_item_id: params[:purchased_item_id], item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchased_params[:token],
      currency: 'jpy'
    )
  end

  
  #def move_to_index
    #if @item.user_id == current_user.id
      #redirect_to action: :index
    #end
  #end
  

end
